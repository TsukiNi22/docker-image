FROM ghcr.io/tsukini22/ci:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    # Unit tests building
    libgtest-dev \
    libgmock-dev \

    # Remove installation dependencies / Cleaning
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
