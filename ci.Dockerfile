FROM fedora:44

RUN dnf install -y \
    # HTTPS certificats
    ca-certificates \

    # Scripts
    wget \
    curl \

    # Compilation
    ccache \
    cmake \
    make \
    rpm-build \
    git \

    # Compilation package
    pkgconf-pkg-config \
    python3 \

    # Compilation Common Dependencies
    openssl-devel \

    # Temporary: required by setup.sh (gpg --dearmor)
    # Keeped (needed by rpm-build)
    gnupg2 \

    # clang
    clang \

    # libutils (with optimized and debug/asan versions)
    && wget -qO- https://raw.githubusercontent.com/TsukiNi22/libutils/main/setup.sh | bash -s -- --no-sudo \
    && dnf install -y libutils-pre libutils-db-pre libutils-as-pre \

    # Remove temporary gpg dependency
    #&& dnf remove -y gnupg2 \

    # Remove installation dependencies / Cleaning
    && dnf clean all

ENV CC=clang
ENV CXX=clang++

WORKDIR /workspace
