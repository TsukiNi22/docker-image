FROM fedora:44

RUN dnf install -y \
    # HTTPS certificats
    ca-certificates \

    # Scripts
    wget \
    curl \
    which \
    procps-ng \

    # Compilation
    ccache \
    cmake \
    make \
    rpm-build \
    git \

    # Compilation package
    pkgconf-pkg-config \
    python3 \
    bsdtar \

    # Compilation Common Dependencies
    openssl-devel \

    # Temporary: required by setup.sh (gpg --dearmor)
    # Keeped (needed by rpm-build)
    gnupg2 \

    # clang
    clang \

    # libutils (with optimized and debug/asan versions)
    && wget -qO- https://raw.githubusercontent.com/TsukiNi22/libutils/main/setup.sh | bash -s -- --no-sudo \
    && dnf install -y libutils libutils-db libutils-as \

    # xstyle (coding style checker / fixer of TsukiNi22/ai-utils, built with libutils)
    && wget -qO- https://raw.githubusercontent.com/TsukiNi22/ai-utils/main/setup.sh | bash -s -- install xstyle --prefix /usr/local \
    && command -v xstyle \
    && rm -rf ~/.local/share/tsukini-skills ~/.cache/tsukini-skills \

    # Remove temporary gpg dependency
    #&& dnf remove -y gnupg2 \

    # Remove installation dependencies / Cleaning
    && dnf clean all

ENV CC=clang
ENV CXX=clang++

WORKDIR /workspace
