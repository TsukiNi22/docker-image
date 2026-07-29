FROM ubuntu:24.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    # HTTPS certificats
    ca-certificates \

    # Scripts
    wget \

    # Compilation
    ccache \
    cmake \
    make \
    rpm \
    git \

    # Compilation package
    pkg-config \
    python3 \

    # Compilation Common Dependencies
    libssl-dev \

    # clang-18
    clang-18 \
    && ln -sf /usr/bin/clang-18 /usr/bin/clang \
    && ln -sf /usr/bin/clang++-18 /usr/bin/clang++ \

    # libutils
    && wget -qO- https://raw.githubusercontent.com/TsukiNi22/libutils/main/setup.sh | bash -s \
    && apt-get install -y libutils \

    # Remove installation dependencies / Cleaning
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV CC=clang
ENV CXX=clang++

WORKDIR /workspace
