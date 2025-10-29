# ------------------------------------------
# Dominus Studio - Dockerfile
# Contenedor IA para TTS + SadTalker
# ------------------------------------------

FROM ubuntu:24.04

# --- Configuración base ---
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    python3 python3-venv python3-pip git ffmpeg libgl1 libglib2.0-0 \
    wget curl unzip xz-utils ca-certificates \
    && apt clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# --- Instalar Coqui TTS y SadTalker (CPU only) ---
RUN pip install --upgrade pip
RUN pip install TTS torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Clonar SadTalker
RUN git clone https://github.com/OpenTalker/SadTalker.git /app/SadTalker
WORKDIR /app/SadTalker
RUN pip install -r requirements.txt --no-cache-dir

# --- Volver al directorio raíz del proyecto ---
WORKDIR /app

# Crear estructura de trabajo
RUN mkdir -p /app/audios /app/avatar /app/videos

# --- Variables de entorno ---
ENV TTS_HOME=/root/.local/share/tts
ENV PATH="/app/SadTalker:${PATH}"

# --- Comando por defecto ---
CMD ["/bin/bash"]
