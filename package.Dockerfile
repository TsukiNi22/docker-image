FROM fedora:40

RUN dnf install -y \
    # HTTPS certificats
    ca-certificates \

    # Scripts
    wget \

    # Signature & repo RPM
    createrepo_c \
    gnupg2 \
    rpm-build \

    # Signature & repo DEB
    dpkg \
    dpkg-dev \
    gzip \
    xz \
    file \

    # Git
    git \

    # Cleaning
    && dnf clean all

WORKDIR /workspace
