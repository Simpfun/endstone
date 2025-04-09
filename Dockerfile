# syntax=docker/dockerfile:1

FROM python:3.12-slim-bullseye

ENV PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8

# Install runtime dependencies
RUN apt-get update -y -qq \
    && apt-get install -y -qq curl \
    && apt-get clean -y -qq \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user for running the application
RUN useradd -m -s /bin/bash endstone \
    && printf "endstone:endstone" | chpasswd \
    && adduser endstone sudo \
    && printf "endstone ALL= NOPASSWD: ALL\\n" >> /etc/sudoers

# Define working directory
WORKDIR /home/endstone

# Install the endstone and clean up
RUN python -m pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir endstone

# Switch to non-root user
USER endstone

# Define the default command to run the application
CMD ["endstone"]