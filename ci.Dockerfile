FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    # HTTPS certificats
    ca-certificates \

    # Compilation
    ccache \
    cmake \
    make \
    git \

    # Compilation package
    pkg-config \
    python3 \

    # clang-18 installation dependencies
    software-properties-common \
    gnupg \
    wget \

    # clang-18
    && wget https://apt.llvm.org/llvm.sh \
    && chmod +x llvm.sh \
    && ./llvm.sh 18 \
    && ln -sf /usr/bin/clang-18 /usr/bin/clang \
    && ln -sf /usr/bin/clang++-18 /usr/bin/clang++ \

    # standard library
    && echo "deb http://deb.debian.org/debian bookworm-backports main" >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends -t bookworm-backports libstdc++-13-dev \

    # Remove installation dependencies
    && apt-get purge -y --auto-remove wget gnupg software-properties-common \
    && rm -rf /var/lib/apt/lists/* llvm.sh

ENV CC=clang
ENV CXX=clang++

WORKDIR /workspace
