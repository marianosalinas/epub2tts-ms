FROM ubuntu:latest

# Install necessary system packages
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.11 python3.11-venv python3.11-dev git build-essential libsndfile1 libffi-dev libssl-dev ffmpeg espeak-ng


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