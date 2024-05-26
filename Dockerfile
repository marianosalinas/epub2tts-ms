# Start from the base image
FROM ubuntu:22.04

# Install necessary system packages
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.11 python3.11-venv python3.11-dev git build-essential libsndfile1 libffi-dev libssl-dev ffmpeg espeak-ng

# Create virtual environment
RUN python3.11 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip
RUN pip install --upgrade pip

# Install CUDA toolkit if needed (uncomment if using GPU)
RUN apt-get install -y nvidia-cuda-toolkit

# Clone the repository
RUN git clone https://github.com/aedocw/epub2tts /opt/epub2tts

# Set the working directory
WORKDIR /opt/epub2tts

# Install Python dependencies
RUN pip install .

# Ensure the epub2tts command is installed correctly
RUN which epub2tts

# Define entrypoint
ENTRYPOINT ["epub2tts"]