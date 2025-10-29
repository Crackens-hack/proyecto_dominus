FROM python:3.10-slim
RUN apt-get update && apt-get install -y ffmpeg git && rm -rf /var/lib/apt/lists/*
WORKDIR /app

RUN pip install --upgrade pip && pip install git+https://github.com/suno-ai/bark.git scipy numpy

RUN mkdir -p /app/audios
CMD ["/bin/bash"]
