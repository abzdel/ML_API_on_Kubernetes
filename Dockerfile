FROM python:3.9

WORKDIR /app
COPY mlapi.py model/ppg_model.pkl requirements.txt /app/

RUN pip install -r requirements.txt
CMD ["uvicorn", "mlapi:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "8000", "--reload"]

# must run container with docker run -p 8000:8000 app

# to clean:
# docker system prune
# minikube ssh -- docker system prune
# above in makefile