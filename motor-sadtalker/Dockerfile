FROM ubuntu:24.04

# Evita prompts y problemas regionales
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Directorio base
WORKDIR /app

# Dependencias del sistema
RUN apt-get update && apt-get install -y \
    python3 python3-pip git ffmpeg libgl1 libglib2.0-0 \
    libsm6 libxrender1 libxext6 wget unzip \
    && rm -rf /var/lib/apt/lists/*

# Actualizar pip
RUN pip install --upgrade pip setuptools wheel

# Instalar PyTorch CPU
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Clonar SadTalker
RUN git clone https://github.com/OpenTalker/SadTalker.git /app/SadTalker

# Instalar dependencias del proyecto
WORKDIR /app/SadTalker
RUN pip install -r requirements.txt --no-cache-dir \
    && pip install opencv-python-headless moviepy tqdm

# Volver a /app y crear directorios compartidos
WORKDIR /app
RUN mkdir -p /app/audios /app/avatar /app/videos

# Mantener el contenedor vivo (idle)
CMD ["tail", "-f", "/dev/null"]
