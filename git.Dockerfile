FROM fedora:40

RUN dnf install -y \
    # HTTPS certificats
    ca-certificates \

    # Scripts
    wget \

    # Git
    git \

    # Cleaning
    && dnf clean all

WORKDIR /workspace
