FROM python:3.12-slim
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY requirements.in .
RUN pip install --no-cache-dir pip-tools
RUN pip-compile -vv  -r  --resolver backtracking  -o ./requirements.txt ./requirements.in && rm -rvf ~/.cache
RUN rm ./requirements.in && pip install   --no-cache-dir -r requirements.txt

