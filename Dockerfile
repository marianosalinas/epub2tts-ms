# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    espeak-ng \
    ffmpeg \
    git \
    && apt-get clean

# Install CUDA toolkit if needed (uncomment if using GPU)
RUN apt-get install -y nvidia-cuda-toolkit

# Clone the repo
RUN git clone https://github.com/aedocw/epub2tts

# Set the working directory
WORKDIR /epub2tts

# Install Python dependencies
RUN pip install .

# Define entrypoint
ENTRYPOINT ["epub2tts"]