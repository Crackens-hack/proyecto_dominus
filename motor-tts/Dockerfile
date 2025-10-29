FROM python:3.10-slim

# Evitar prompts interactivos de apt
ENV DEBIAN_FRONTEND=noninteractive

# --- Dependencias del sistema ---
RUN apt-get update && apt-get install -y \
    ffmpeg git build-essential libsndfile1 \
    && rm -rf /var/lib/apt/lists/*

# --- Directorio de trabajo ---
WORKDIR /app

# --- Actualizar pip y herramientas base ---
RUN pip install --upgrade pip setuptools wheel

# --- Instalar PyTorch CPU ---
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# --- Instalar Coqui TTS ---
RUN pip install TTS

# --- Crear directorio de salida ---
RUN mkdir -p /app/audios

# --- Mantener el contenedor vivo ---
CMD ["tail", "-f", "/dev/null"]
