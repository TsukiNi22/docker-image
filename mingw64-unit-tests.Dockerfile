FROM ghcr.io/tsukini22/mingw64-ci:latest

# Windows tests executed through wine (CMAKE_CROSSCOMPILING_EMULATOR)
ENV CMAKE_CROSSCOMPILING_EMULATOR=wine
ENV WINEDEBUG=-all
ENV WINEPATH=/usr/x86_64-w64-mingw32/sys-root/mingw/bin
# No mono / gecko install prompt (no display in the CI)
ENV WINEDLLOVERRIDES="mscoree,mshtml=;winemenubuilder.exe=d"

RUN dnf install -y \
    # Run the windows executables (ctest emulator)
    wine-core \

    # Unit tests building (no mingw64 package: built from the sources)
    && git clone -q --depth 1 https://github.com/google/googletest.git /tmp/googletest \
    && cmake -S /tmp/googletest -B /tmp/googletest-build -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/x86_64-w64-mingw32/sys-root/mingw \
    && cmake --build /tmp/googletest-build --parallel \
    && cmake --install /tmp/googletest-build \
    && rm -rf /tmp/googletest /tmp/googletest-build \

    # Wine prefix created at build time (the first start takes ~5 min)
    && wine wineboot --init \
    && wineserver --kill \

    # Cleaning
    && dnf clean all
