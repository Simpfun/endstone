# syntax=docker/dockerfile:1

FROM python:3.12-slim-bullseye

ENV PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8

# Install runtime dependencies
RUN apt-get update -y -qq \
    && apt-get install -y -qq curl \
    && apt-get clean -y -qq \
    && rm -rf /var/lib/apt/lists/*

# Initialize working directory
WORKDIR /home/container
COPY start.sh ./
RUN chmod +x start.sh

# Define the default command to run the application
ENTRYPOINT ["./start.sh"]