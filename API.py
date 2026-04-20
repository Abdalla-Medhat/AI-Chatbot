from fastapi import FastAPI
from pydantic import BaseModel
import json
import numpy as np
import pickle as pkl
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing.sequence import pad_sequences

app = FastAPI()

# load
model = load_model("model.h5")
tokenizer = pkl.load(open("tokenizer.pkl", "rb"))
encoder = pkl.load(open("encoder.pkl", "rb"))

with open("data.json") as f:
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
def chat_api(req: Request):
    return {"response": chat(req.message)}
