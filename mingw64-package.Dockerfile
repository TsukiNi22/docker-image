FROM fedora:44

RUN dnf install -y \
    # HTTPS certificats
    ca-certificates \

    # Scripts
    wget \
    which \

    # Windows installers (.exe NSIS / .msi)
    mingw32-nsis \
    msitools \

    # Windows archives
    zip \

    # Windows signature (Authenticode)
    osslsigncode \
    gnupg2 \

    # Dll dependencies inspection (x86_64-w64-mingw32-objdump)
    mingw64-binutils \
    file \

    # Git
    git \

    # Cleaning
    && dnf clean all

WORKDIR /workspace
