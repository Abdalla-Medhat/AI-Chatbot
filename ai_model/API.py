from fastapi import FastAPI, Header, HTTPException, Request
from pydantic import BaseModel
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

# load
model = load_model(BASE_DIR / "model.h5")
tokenizer = pkl.load(open(BASE_DIR / "tokenizer.pkl", "rb"))
encoder = pkl.load(open(BASE_DIR / "encoder.pkl", "rb"))

with open(BASE_DIR / "data.json") as f:
    data = json.load(f)

class Request(BaseModel):
    message: str

def chat(user_message):
    sequences = tokenizer.texts_to_sequences([user_message.lower()])
    padded = pad_sequences(sequences, truncating='pre', maxlen=20)

    prediction = model.predict(np.array(padded), verbose=0)
    label_index = int(prediction.argmax(axis=1)[0])
    label_name = encoder.inverse_transform([label_index])[0]

    for item in data['data']:
        if item['label'] == label_name:
            return str(np.random.choice(item['responses']))

    return "I don't understand."

@app.post("/chat")
def chat_api(req: Request, x_api_key: str = Header(...)):
    forwarded_for = req.headers.get("x-forwarded-for")

    if forwarded_for:
        client_ip = forwarded_for.split(",")[0].strip()
    else:
        client_ip = req.client.host

    if not check_rate_limit(client_ip):
        raise HTTPException(
            status_code=429,
            detail="Too many requests. Please try again later."
        )

    if x_api_key != API_KEY:
        raise HTTPException(status_code=401, detail="Invalid API Key")

    return {"response": chat(req.message)}

@app.get("/redis-test")
def redis_test():
    redis.set("test", "Hello Redis")
    value = redis.get("test")

    return {"redis": value}