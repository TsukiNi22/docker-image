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

    # Signature & repo Arch (repo-add, pacman-key)
    pacman \
    bsdtar \
    zstd \

    # Windows installers (.exe NSIS / .msi) & archives
    mingw32-nsis \
    msitools \
    zip \

    # Windows signature (Authenticode)
    osslsigncode \

    # Windows dll dependencies inspection (x86_64-w64-mingw32-objdump)
    mingw64-binutils \

    # Git
    git \

    # Cleaning
    && dnf clean all

WORKDIR /workspace
