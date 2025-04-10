# syntax=docker/dockerfile:1

FROM python:3.12-slim-bullseye

ENV PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8

# Install runtime dependencies
RUN apt-get update -y -qq \
    && apt-get install -y -qq curl \
    && apt-get clean -y -qq \
    && rm -rf /var/lib/apt/lists/*

# Initialize the runtime
COPY --chmod=755 entrypoint.sh /usr/local/bin/entrypoint.sh
COPY --chmod=755 start.sh /home/container/start.sh

WORKDIR /home/container

# Define the default command to run the application
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]