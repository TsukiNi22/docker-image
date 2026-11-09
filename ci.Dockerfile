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

    # libutils pre-release channel (latest version, even unstable) (with optimized and debug/asan versions)
    && wget -qO- https://raw.githubusercontent.com/TsukiNi22/libutils/main/setup.sh | bash -s -- --no-sudo \
    && dnf install -y libutils-pre libutils-db-pre libutils-as-pre \

    # xstyle (coding style checker / fixer of TsukiNi22/xstyle, built with libutils, + its completion)
    && git clone -q --depth 1 https://github.com/TsukiNi22/xstyle.git /tmp/xstyle \
    && cmake -S /tmp/xstyle -B /tmp/xstyle/build -DCMAKE_BUILD_TYPE=Optimized \
    && cmake --build /tmp/xstyle/build --parallel "$(nproc)" \
    && cmake --install /tmp/xstyle/build --prefix /usr/local \
    && command -v xstyle \
    && rm -rf /tmp/xstyle \

    # Remove temporary gpg dependency
    #&& dnf remove -y gnupg2 \

    # Remove installation dependencies / Cleaning
    && dnf clean all

ENV CC=clang
ENV CXX=clang++

WORKDIR /workspace
