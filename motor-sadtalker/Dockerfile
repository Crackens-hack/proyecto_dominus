FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

RUN apt-get update && apt-get install -y python3 python3-pip git ffmpeg libgl1 libglib2.0-0 && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip && pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

RUN git clone https://github.com/OpenTalker/SadTalker.git /app/SadTalker
WORKDIR /app/SadTalker
RUN pip install -r requirements.txt --no-cache-dir

WORKDIR /app
RUN mkdir -p /app/audios /app/avatar /app/videos
CMD ["/bin/bash"]
