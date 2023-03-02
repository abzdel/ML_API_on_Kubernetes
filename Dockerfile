FROM python:latest

WORKDIR /app
COPY . /app

RUN make install
CMD ["python", "mlapi.py"]