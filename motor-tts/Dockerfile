FROM python:3.10-slim

# --- Dependencias básicas ---
RUN apt-get update && apt-get install -y \
    ffmpeg git build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# --- Instalar Coqui TTS + PyTorch CPU ---
RUN pip install --upgrade pip
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install TTS

RUN mkdir -p /app/audios
CMD ["/bin/bash"]
