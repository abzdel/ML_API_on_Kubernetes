FROM python:latest

WORKDIR /app
COPY . /app

RUN make install
CMD ["uvicorn", "mlapi:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "8000", "--reload"]

# must run container with docker run -p 8000:8000 app