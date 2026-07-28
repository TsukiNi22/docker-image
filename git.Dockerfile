FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    # HTTPS certificats
    ca-certificates \

    # Scripts
    wget \

    # Git
    git \

    # Remove installation dependencies
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
