FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    # HTTPS certificats
    ca-certificates \

    # Scripts
    wget \

    # Signature & repo RPM
    createrepo-c \
    gnupg \
    rpm \

    # Git
    git \

    # Remove installation dependencies
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
