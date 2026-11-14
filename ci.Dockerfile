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

    # Signature (needed by rpm-build)
    gnupg2 \

    # clang
    clang \

    # my-universe repositories (libutils, brain, xstyle)
    && wget -qO- https://tsukini22.github.io/my-universe/install.sh | bash -s -- --no-sudo --only libutils,brain,xstyle \

    # libutils & brain pre-release channel (latest version, even unstable) (with optimized and debug/asan versions)
    # xstyle pre-release channel (coding style checker / fixer, + its completion)
    && dnf install -y \
        libutils-pre libutils-db-pre libutils-as-pre \
        libbrain-pre libbrain-db-pre libbrain-as-pre \
        xstyle-pre \
    && command -v xstyle \

    # Cleaning
    && dnf clean all

ENV CC=clang
ENV CXX=clang++

WORKDIR /workspace
