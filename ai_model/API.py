from fastapi import FastAPI, Header, HTTPException, Request
from pydantic import BaseModel, Field, ConfigDict
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse
import unicodedata
import json
import numpy as np
import pickle as pkl
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.sequence import pad_sequences
from pathlib import Path
import os
from upstash_redis import Redis

BASE_DIR = Path(__file__).resolve().parent

app = FastAPI()

# Custom Validation Error Handler
@app.exception_handler(RequestValidationError)
async def validation_exception_handler(
    request: Request,
    exc: RequestValidationError
):
    return JSONResponse(
        status_code=422,
        content={"detail": "Invalid request"}
    )

# Global Exception Handler
@app.exception_handler(Exception)
async def global_exception_handler(request: Request, exc: Exception):
    return JSONResponse(
        status_code=500,
        content={"detail": "Internal server error"}
    )

API_KEY = os.getenv("API_KEY")

redis = Redis(
    url=os.getenv("UPSTASH_REDIS_REST_URL"),
    token=os.getenv("UPSTASH_REDIS_REST_TOKEN"),
)

RATE_LIMIT = 10
RATE_WINDOW = 60

def check_rate_limit(ip: str):
    key = f"rate_limit:{ip}"
    current_count = redis.incr(key)
    if current_count == 1:
        redis.expire(key, RATE_WINDOW)
    return current_count <= RATE_LIMIT

# Startup Artifact Checks
REQUIRED_FILES = [
    BASE_DIR / "model.h5",
    BASE_DIR / "tokenizer.pkl",
    BASE_DIR / "encoder.pkl",
    BASE_DIR / "data.json"
]

for file_path in REQUIRED_FILES:
    if not file_path.exists():
        raise RuntimeError(f"Required artifact missing: {file_path.name}")
    
# Load artifacts
model = load_model(BASE_DIR / "model.h5")
tokenizer = pkl.load(open(BASE_DIR / "tokenizer.pkl", "rb"))
encoder = pkl.load(open(BASE_DIR / "encoder.pkl", "rb"))

with open(BASE_DIR / "data.json") as f:
    data = json.load(f)

INVISIBLE_UNICODE = {
    "\u200b",  # Zero Width Space
    "\u200c",  # Zero Width Non-Joiner
    "\u200d",  # Zero Width Joiner
    "\ufeff",  # BOM
    "\u2060",  # Word Joiner
}

def normalize_input(message: str) -> str:
    message = unicodedata.normalize("NFKC", message)

    if "\x00" in message:
        raise HTTPException(
            status_code=400,
            detail="Invalid message"
        )

    for char in message:
        if char in INVISIBLE_UNICODE:
            raise HTTPException(
                status_code=400,
                detail="Invalid message"
            )

    message = " ".join(message.split())

    if not message:
        raise HTTPException(
            status_code=400,
            detail="Invalid message"
        )

    return message.lower()

class ChatRequest(BaseModel):
    model_config = ConfigDict(extra="forbid")

    message: str = Field(
        ...,
        min_length=1,
        max_length=2048
    )

def chat(user_message):
    user_message = normalize_input(user_message)
    sequences = tokenizer.texts_to_sequences([user_message])

    padded = pad_sequences(sequences, truncating='pre', maxlen=20)

    prediction = model.predict(np.array(padded), verbose=0)

    # Model Output Validation
    if prediction is None or not isinstance(prediction, np.ndarray):
        raise HTTPException(status_code=500, detail="Internal server error")

    if prediction.ndim != 2 or prediction.shape[0] != 1 or prediction.shape[1] == 0:
        raise HTTPException(status_code=500, detail="Internal server error")

    if np.isnan(prediction).any() or np.isinf(prediction).any():
        raise HTTPException(status_code=500, detail="Internal server error")
    
    label_index = int(prediction.argmax(axis=1)[0])
    label_name = encoder.inverse_transform([label_index])[0]

    response_text = None
    for item in data['data']:
        if item['label'] == label_name:
            response_text = str(np.random.choice(item['responses']))
            break

    if not response_text:
        response_text = "I don't understand."

    # Safe Response Validation
    response_text = response_text.strip()

    if not response_text or len(response_text) > 1000:
        raise HTTPException(status_code=500, detail="Internal server error")

    return response_text

@app.post("/chat")
async def chat_api(
    request: Request,
    req: ChatRequest,
    x_api_key: str = Header(...)
):
    forwarded_for = request.headers.get("x-forwarded-for")

    if forwarded_for:
        client_ip = forwarded_for.split(",")[0].strip()
    else:
        client_ip = request.client.host

    if x_api_key != API_KEY:
        raise HTTPException(
            status_code=401,
            detail="Invalid API Key"
        )

    if not check_rate_limit(client_ip):
        raise HTTPException(
            status_code=429,
            detail="Too many requests. Please try again later."
        )

    return {"response": chat(req.message)}