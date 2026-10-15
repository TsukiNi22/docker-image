FROM fedora:44

RUN dnf install -y \
    # HTTPS certificats
    ca-certificates \

    # Scripts
    wget \
    curl \
    which \

    # Compilation
    ccache \
    cmake \
    make \
    rpm-build \
    git \

    # Compilation package
    pkgconf-pkg-config \
    python3 \

    # Windows cross compilation (x86_64-w64-mingw32)
    mingw64-gcc \
    mingw64-gcc-c++ \
    mingw64-binutils \

    # CMake toolchain & pkg-config wrappers (mingw64-cmake, x86_64-w64-mingw32-pkg-config)
    mingw64-filesystem \

    # Static runtime (standalone .exe without the gcc/pthread dll)
    mingw64-winpthreads-static \

    # Compilation Common Dependencies (windows)
    mingw64-openssl \

    # Native build of xstyle (clang, libutils linux, ps for the ai-utils setup.sh)
    clang \
    openssl-devel \
    gnupg2 \
    procps-ng \

    # libutils linux (needed by xstyle)
    # Temporary: mingw64-libutils-pre / mingw64-libutils-db-pre (windows) added once published (built in this image)
    && wget -qO- https://raw.githubusercontent.com/TsukiNi22/libutils/main/setup.sh | bash -s -- --no-sudo \
    && dnf install -y libutils \

    # xstyle (coding style checker / fixer of TsukiNi22/ai-utils, built with libutils)
    && wget -qO- https://raw.githubusercontent.com/TsukiNi22/ai-utils/main/setup.sh | bash -s -- install xstyle --prefix /usr/local \
    && command -v xstyle \
    && rm -rf ~/.local/share/tsukini-skills ~/.cache/tsukini-skills \

    # Cleaning
    && dnf clean all

# The toolchain file uses CC/CXX when they are defined
ENV CC=x86_64-w64-mingw32-gcc
ENV CXX=x86_64-w64-mingw32-g++
ENV CMAKE_TOOLCHAIN_FILE=/usr/share/mingw/toolchain-mingw64.cmake

WORKDIR /workspace
