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

    # my-universe repositories (libutils, brain, xstyle)
    && wget -qO- https://tsukini22.github.io/my-universe/install.sh | bash -s -- --no-sudo --only libutils,brain,xstyle \

    # libutils & brain windows pre-release channel (latest version, even unstable) (optimized & debug, mingw sysroot)
    # xstyle pre-release channel (native coding style checker / fixer, + its completion)
    && dnf install -y \
        mingw64-libutils-pre mingw64-libutils-db-pre \
        mingw64-libbrain-pre mingw64-libbrain-db-pre \
        xstyle-pre \
    && command -v xstyle \

    # Cleaning
    && dnf clean all

# The toolchain file uses CC/CXX when they are defined
ENV CC=x86_64-w64-mingw32-gcc
ENV CXX=x86_64-w64-mingw32-g++
ENV CMAKE_TOOLCHAIN_FILE=/usr/share/mingw/toolchain-mingw64.cmake

WORKDIR /workspace
