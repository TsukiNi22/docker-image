# Docker Images

This repository contains Docker images for development and CI/CD.

> [!IMPORTANT]
> All exemple/explication are using `ci.Dockerfile`

## Repository Content

```
ghcr.io/tsukini22/git:latest # git/wget
ghcr.io/tsukini22/package:latest # git/wget with rpm/deb + signature tools
ghcr.io/tsukini22/ci:latest # clang -> c/c++ with cmake & make
ghcr.io/tsukini22/unit-tests:latest # clang -> c/c++ unit-tests with cmake & make
ghcr.io/tsukini22/mingw64-ci:latest # mingw64 -> c/c++ windows cross compilation with cmake & make
ghcr.io/tsukini22/mingw64-unit-tests:latest # mingw64 -> c/c++ windows unit-tests run with wine
ghcr.io/tsukini22/mingw64-package:latest # package with windows installers + signature tools
```

## Included tools

| Image | Tools |
| ----- | ----- |
| `git:latest` | `git`, `wget` |
| `package:latest` | `git`, `wget`, `rpm`, `createrepo-c`, `dpkg`, `gzip`, `xz`, `file` |
| `ci:latest` | `clang/clang++ (18)`, `ccache`, `cmake`, `make`, `rpm`, `git`, `pkg-config`, `python3`, `wget`, `libutils`, `xstyle` |
| `unit-tests:latest` | `ci:latest`, `Google test c++` |
| `mingw64-ci:latest` | `mingw64-gcc/g++ (x86_64-w64-mingw32)`, `ccache`, `cmake`, `make`, `git`, `pkg-config`, `python3`, `wget`, `mingw64-binutils`, `mingw64-cmake`, `mingw64-pkg-config`, `mingw64-openssl`, `mingw64-winpthreads-static`, `clang/clang++`, `libutils`, `xstyle` |
| `mingw64-unit-tests:latest` | `mingw64-ci:latest`, `Google test c++ (mingw64)`, `wine` |
| `mingw64-package:latest` | `git`, `wget`, `gnupg2`, `file`, `makensis (NSIS)`, `wixl (msitools)`, `zip`, `osslsigncode`, `mingw64-objdump` |

> [!NOTE]
> The `mingw64-*` images set `CC`, `CXX` and `CMAKE_TOOLCHAIN_FILE` (`/usr/share/mingw/toolchain-mingw64.cmake`):
> a plain `cmake -S . -B build` cross compiles for windows (x86_64). They are independent from the `ci` / `package`
> images (based on `fedora:44`). The linux `libutils` and `clang` are only there for the native `xstyle` (libutils for
> windows not included yet). `mingw64-unit-tests` sets `CMAKE_CROSSCOMPILING_EMULATOR=wine` so `ctest` runs the `.exe`.

## Status
| Name + Link | Version | Last Update | Status |
| ----------- | ------- | ----------- | ------ |
| [git][git-link] | ![Version][git-version] | ![Update][git-update] | ![Build Image - GIT][git-build] |
| [package][package-link] | ![Version][package-version] | ![Update][package-update] | ![Build Image - Package][package-build] |
| [ci][ci-link] | ![Version][ci-version] | ![Update][ci-update] | ![Build Image - CI][ci-build] |
| [unit-tests][unit-tests-link] | ![Version][unit-tests-version] | ![Update][unit-tests-update] | ![Build Image - Unit-Tests][unit-tests-build] |
| [mingw64-ci][mingw64-ci-link] | ![Version][mingw64-ci-version] | ![Update][mingw64-ci-update] | ![Build Image - MinGW64-CI][mingw64-ci-build] |
| [mingw64-unit-tests][mingw64-unit-tests-link] | ![Version][mingw64-unit-tests-version] | ![Update][mingw64-unit-tests-update] | ![Build Image - MinGW64-Unit-Tests][mingw64-unit-tests-build] |
| [mingw64-package][mingw64-package-link] | ![Version][mingw64-package-version] | ![Update][mingw64-package-update] | ![Build Image - MinGW64-Package][mingw64-package-build] |

[git-link]: https://github.com/TsukiNi22/docker-image/pkgs/container/git
[git-version]: https://ghcr-badge.egpl.dev/tsukini22/git/latest_tag?trim=major&label=latest
[git-update]: https://img.shields.io/github/last-commit/TsukiNi22/docker-image?path=git.Dockerfile
[git-build]: https://github.com/TsukiNi22/docker-image/actions/workflows/build-image-git.yml/badge.svg

[package-link]: https://github.com/TsukiNi22/docker-image/pkgs/container/package
[package-version]: https://ghcr-badge.egpl.dev/tsukini22/package/latest_tag?trim=major&label=latest
[package-update]: https://img.shields.io/github/last-commit/TsukiNi22/docker-image?path=package.Dockerfile
[package-build]: https://github.com/TsukiNi22/docker-image/actions/workflows/build-image-package.yml/badge.svg

[ci-link]: https://github.com/TsukiNi22/docker-image/pkgs/container/ci
[ci-version]: https://ghcr-badge.egpl.dev/tsukini22/ci/latest_tag?trim=major&label=latest
[ci-update]: https://img.shields.io/github/last-commit/TsukiNi22/docker-image?path=ci.Dockerfile
[ci-build]: https://github.com/TsukiNi22/docker-image/actions/workflows/build-image-ci.yml/badge.svg

[unit-tests-link]: https://github.com/TsukiNi22/docker-image/pkgs/container/unit-tests
[unit-tests-version]: https://ghcr-badge.egpl.dev/tsukini22/unit-tests/latest_tag?trim=major&label=latest
[unit-tests-update]: https://img.shields.io/github/last-commit/TsukiNi22/docker-image?path=unit-tests.Dockerfile
[unit-tests-build]: https://github.com/TsukiNi22/docker-image/actions/workflows/build-image-unit-tests.yml/badge.svg

[mingw64-ci-link]: https://github.com/TsukiNi22/docker-image/pkgs/container/mingw64-ci
[mingw64-ci-version]: https://ghcr-badge.egpl.dev/tsukini22/mingw64-ci/latest_tag?trim=major&label=latest
[mingw64-ci-update]: https://img.shields.io/github/last-commit/TsukiNi22/docker-image?path=mingw64-ci.Dockerfile
[mingw64-ci-build]: https://github.com/TsukiNi22/docker-image/actions/workflows/build-image-mingw64-ci.yml/badge.svg

[mingw64-unit-tests-link]: https://github.com/TsukiNi22/docker-image/pkgs/container/mingw64-unit-tests
[mingw64-unit-tests-version]: https://ghcr-badge.egpl.dev/tsukini22/mingw64-unit-tests/latest_tag?trim=major&label=latest
[mingw64-unit-tests-update]: https://img.shields.io/github/last-commit/TsukiNi22/docker-image?path=mingw64-unit-tests.Dockerfile
[mingw64-unit-tests-build]: https://github.com/TsukiNi22/docker-image/actions/workflows/build-image-mingw64-unit-tests.yml/badge.svg

[mingw64-package-link]: https://github.com/TsukiNi22/docker-image/pkgs/container/mingw64-package
[mingw64-package-version]: https://ghcr-badge.egpl.dev/tsukini22/mingw64-package/latest_tag?trim=major&label=latest
[mingw64-package-update]: https://img.shields.io/github/last-commit/TsukiNi22/docker-image?path=mingw64-package.Dockerfile
[mingw64-package-build]: https://github.com/TsukiNi22/docker-image/actions/workflows/build-image-mingw64-package.yml/badge.svg

---

## Build locally

Clone the repository:

```bash
git clone https://github.com/TsukiNi22/docker-image.git
cd docker-image
```

Build the CI image:

```bash
docker build -t ci:latest -f .github/ci.Dockerfile .
```

You can run it using:

```bash
docker run --rm -it ci:latest bash
```

## Publish to GitHub Container Registry (GHCR)

Tag the image:

```bash
docker tag ci:latest ghcr.io/<github_username_lowercase>/ci:latest
```

Authenticate with GitHub Container Registry:

```bash
echo <github_token> | docker login ghcr.io -u <github_username> --password-stdin
```

Push the image:

```bash
docker push ghcr.io/<github_username_lowercase>/ci:latest
```

## Use the pre-built image

Pull the latest image:

```bash
docker pull ghcr.io/tsukini22/ci:latest
```

Run a shell inside the container:

```bash
docker run --rm -it ghcr.io/tsukini22/ci:latest bash
```

## Use in GitHub Actions

```yaml
jobs:
  build:
    runs-on: ubuntu-latest

    container:
      image: ghcr.io/tsukini22/ci:latest

    steps:
      - uses: actions/checkout@v4

      - name: Configure
        run: cmake -B build -S .

      - name: Build
        run: cmake --build build
```

Windows cross compilation (same commands, the toolchain is set by the image):

```yaml
jobs:
  build-windows:
    runs-on: ubuntu-latest

    container:
      image: ghcr.io/tsukini22/mingw64-ci:latest

    steps:
      - uses: actions/checkout@v4

      - name: Configure
        run: cmake -B build -S . -DCMAKE_EXE_LINKER_FLAGS="-static"

      - name: Build
        run: cmake --build build
```

## Use in GitLab CI

```yaml
image: ghcr.io/tsukini22/ci:latest

stages:
  - build

build:
  stage: build
  script:
    - cmake -B build -S .
    - cmake --build build
```
