# Imagen base liviana con Python 3.10
FROM python:3.10-slim

# Evitar prompts interactivos de apt
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    ffmpeg git build-essential \
    && rm -rf /var/lib/apt/lists/*

# Establecer directorio de trabajo
WORKDIR /app

# Actualizar pip y dependencias de audio
RUN pip install --upgrade pip setuptools wheel

# Instalar Bark y sus dependencias necesarias
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu \
    && pip install git+https://github.com/suno-ai/bark.git scipy numpy soundfile

# Crear carpetas necesarias
RUN mkdir -p /app/audios

# Mantener el contenedor vivo (idle)
CMD ["tail", "-f", "/dev/null"]
