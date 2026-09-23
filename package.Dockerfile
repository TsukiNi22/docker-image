FROM fedora:44

RUN dnf install -y \
    # HTTPS certificats
    ca-certificates \

    # Scripts
    wget \
    which \

    # Signature & repo RPM
    createrepo_c \
    gnupg2 \
    rpm-build \
    rpm-sign \

    # Signature & repo DEB
    dpkg \
    dpkg-dev \
    apt-utils \
    gzip \
    xz \
    file \

    # Git
    git \

    # Cleaning
    && dnf clean all

WORKDIR /workspace
