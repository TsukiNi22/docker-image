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

    # Native build of xstyle (clang + libutils linux)
    clang \
    openssl-devel \
    gnupg2 \

    # libutils windows (mingw sysroot) & linux (needed by xstyle)
    && wget -qO- https://raw.githubusercontent.com/TsukiNi22/libutils/main/setup.sh | bash -s -- --no-sudo \
    && dnf install -y mingw64-libutils-pre mingw64-libutils-db-pre libutils \

    # xstyle (coding style checker / fixer of TsukiNi22/skills, built with libutils)
    && git clone -q --depth 1 https://github.com/TsukiNi22/skills.git /tmp/skills \
    && cmake -S /tmp/skills/style/xstyle -B /tmp/xstyle -DCMAKE_BUILD_TYPE=Optimized \
    && cmake --build /tmp/xstyle --parallel \
    && cmake --install /tmp/xstyle --prefix /usr/local \
    && rm -rf /tmp/skills /tmp/xstyle \

    # Cleaning
    && dnf clean all

# The toolchain file uses CC/CXX when they are defined
ENV CC=x86_64-w64-mingw32-gcc
ENV CXX=x86_64-w64-mingw32-g++
ENV CMAKE_TOOLCHAIN_FILE=/usr/share/mingw/toolchain-mingw64.cmake

WORKDIR /workspace
