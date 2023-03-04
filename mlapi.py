from fastapi import FastAPI
import pickle
import uvicorn
import numpy as np

app = FastAPI()


with open("ppg_model.pkl", "rb") as f:
    model = pickle.load(f)


@app.get("/")
async def root():
    return {"hello": "mlapi. add /docs to the url above to see usage of this tool."}


@app.get("/predict/{pts_5}/{stl_5}/{ft_pct_5}/{min_5}")
async def predict_ppg(pts_5, stl_5, ft_pct_5, min_5):

    pred = model.predict(np.array([float(pts_5), float(stl_5), float(ft_pct_5), float(min_5)]).reshape(1, -1))
    return {"prediction": pred[0]}


if __name__ == "__main__":
    uvicorn.run(app, port=8080, host="0.0.0.0")
