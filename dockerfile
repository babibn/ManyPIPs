FROM python:3.12-slim
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY requirements.txt .
RUN pip install   --no-cache-dir -r requirements.txt
