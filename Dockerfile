FROM ubuntu:22.04

# Install necessary system packages
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.11 python3.11-venv python3.11-dev git build-essential libsndfile1 libffi-dev libssl-dev ffmpeg espeak-ng && \
    apt-get install -y python3-pip

# Install CUDA toolkit if needed (uncomment if using GPU)
# RUN apt-get install -y nvidia-cuda-toolkit

# Clone the repo
RUN git clone https://github.com/aedocw/epub2tts

# Set the working directory
WORKDIR /epub2tts

# Print Python and pip versions
RUN python3.11 --version && pip3 --version

# Install Python dependencies
RUN pip3 install .

# Define entrypoint
ENTRYPOINT ["epub2tts"]
