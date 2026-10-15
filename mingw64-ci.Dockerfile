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

    # Native build of xstyle (clang, ps for the ai-utils setup.sh)
    clang \
    openssl-devel \
    gnupg2 \
    procps-ng \

    # libutils windows (optimized & debug, mingw sysroot)
    # Temporary: libutils linux (xstyle build only, its libutils rules read the mingw sysroot)
    && wget -qO- https://raw.githubusercontent.com/TsukiNi22/libutils/main/setup.sh | bash -s -- --no-sudo \
    && dnf install -y mingw64-libutils mingw64-libutils-db libutils \

    # xstyle (coding style checker / fixer of TsukiNi22/ai-utils, built with libutils)
    && wget -qO- https://raw.githubusercontent.com/TsukiNi22/ai-utils/main/setup.sh | bash -s -- install xstyle --prefix /usr/local \
    && command -v xstyle \
    && rm -rf ~/.local/share/tsukini-skills ~/.cache/tsukini-skills \

    # Remove temporary libutils linux
    && dnf remove -y libutils libutils-op libutils-dev libutils-dev-op \

    # Cleaning
    && dnf clean all

# The toolchain file uses CC/CXX when they are defined
ENV CC=x86_64-w64-mingw32-gcc
ENV CXX=x86_64-w64-mingw32-g++
ENV CMAKE_TOOLCHAIN_FILE=/usr/share/mingw/toolchain-mingw64.cmake

WORKDIR /workspace
