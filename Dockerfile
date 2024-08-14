# Dockerfile
FROM python:3.9-slim

WORKDIR /app

RUN pip install Flask==2.0.3

COPY app.py app.py

CMD ["python", "app.py"]
