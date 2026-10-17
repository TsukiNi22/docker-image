# Changelog
All notable changes to this project will be documented in this file.

> [!CAUTION]
> All versions start at `1.0.0`. If you don't find an old changelog, see `old-changelog/*.md`

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [git:Unreleased] (empty)

## [git:v2.0.0] - 2026-09-22
### Changed
- **[MAJOR]** switch to fedora as root container

## [git:v1.0.0] - 2026-07-28
### Added
- Initial version of the GIT image with only basic tools (git, wget)

[git:Unreleased]: https://github.com/TsukiNi22/docker-image/commits/main/git.Dockerfile
[git:v2.0.0]: https://github.com/TsukiNi22/docker-image/commits/git/v2.0.0/git.Dockerfile
[git:v1.0.0]: https://github.com/TsukiNi22/docker-image/commits/git/v1.0.0/git.Dockerfile

---

## [package:Unreleased] (empty)

## [package:v2.2.0] - 2026-10-17
### Added
- Arch Linux (pacman) repository tools: `pacman` (`repo-add`), `bsdtar`, `zstd` (libutils `arch/` repository on gh-pages)

## [package:v2.1.0] - 2026-10-15
### Added
- Windows packaging tools (installers `NSIS` / `msitools`, `zip`, `osslsigncode`, `mingw64-objdump`), merged from the `mingw64-package` image

## [package:v2.0.1] - 2026-09-23
### Fixed
- Add missing package such as `which` for scripts

## [package:v2.0.0] - 2026-09-22
### Changed
- **[MAJOR]** switch to fedora as root container

## [package:v1.2.0] - 2026-07-29
### Added
- Add debian packaging tools

## [package:v1.1.0] - 2026-07-28
### Added
- RPM dependencies

## [package:v1.0.0] - 2026-07-28
### Added
- Initial version of the PACKAGE image with only basic tools (git, wget, signature tools, ...)

[package:Unreleased]: https://packagehub.com/TsukiNi22/docker-image/commits/main/package.Dockerfile
[package:v2.2.0]: https://packagehub.com/TsukiNi22/docker-image/commits/package/v2.2.0/package.Dockerfile
[package:v2.1.0]: https://packagehub.com/TsukiNi22/docker-image/commits/package/v2.1.0/package.Dockerfile
[package:v2.0.1]: https://packagehub.com/TsukiNi22/docker-image/commits/package/v2.0.1/package.Dockerfile
[package:v2.0.0]: https://packagehub.com/TsukiNi22/docker-image/commits/package/v2.0.0/package.Dockerfile
[package:v1.2.0]: https://packagehub.com/TsukiNi22/docker-image/commits/package/v1.2.0/package.Dockerfile
[package:v1.1.0]: https://packagehub.com/TsukiNi22/docker-image/commits/package/v1.1.0/package.Dockerfile
[package:v1.0.0]: https://packagehub.com/TsukiNi22/docker-image/commits/package/v1.0.0/package.Dockerfile

---

## [ci:Unreleased] (empty)

## [ci:v2.2.0] - 2026-10-17
### Added
- `bsdtar` (libarchive): the Arch Linux packages (`.pkg.tar.zst`) of libutils are built by CPack

## [ci:v2.1.1] - 2026-10-15
### Fixed
- `libutils` stable channel (`libutils`, `libutils-db`, `libutils-as`) instead of `-pre` (2.14.0): `xstyle` requires libutils 4.0.0
- `xstyle` installed with the `setup.sh` of [ai-utils](https://github.com/TsukiNi22/ai-utils) (`install xstyle`), `procps-ng` added for it

## [ci:v2.1.0] - 2026-10-06
### Added
- `xstyle` (coding style checker / fixer of [skills](https://github.com/TsukiNi22/skills), built from `style/xstyle`) for the style check step of the workflows

## [ci:v2.0.2] - 2026-09-23
### Fixed
- Add missing package such as `which` for scripts

## [ci:v2.0.1] - 2026-09-23
### Fixed
- A package removed (temporary one: `gnupg2`) was needed to keep `rmp-build`

## [ci:v2.0.0] - 2026-09-22
### changed
- **[major]** switch to fedora as root container

## [ci:v1.3.1] - 2026-09-22
### Fixed
- `libutils-db` & `libutils-as` for debug purpose (missing for some test)

## [ci:v1.3.0] - 2026-07-29
### Added
- `libutils` packages (c++20 library)

## [ci:v1.2.0] - 2026-07-28
### Added
- RPM dependencies

## [ci:v1.1.0] - 2026-07-20
### Added
- ssl (`-lssl -lcrypto`) common compilation dependencies

## [ci:v1.0.0] - 2026-07-17
### Added
- Initial version of the CI image with basic tools (cmake, clang, wget...)

[ci:Unreleased]: https://github.com/TsukiNi22/docker-image/commits/main/ci.Dockerfile
[ci:v2.2.0]: https://github.com/TsukiNi22/docker-image/commits/ci/v2.2.0/ci.Dockerfile
[ci:v2.1.1]: https://github.com/TsukiNi22/docker-image/commits/ci/v2.1.1/ci.Dockerfile
[ci:v2.1.0]: https://github.com/TsukiNi22/docker-image/commits/ci/v2.1.0/ci.Dockerfile
[ci:v2.0.2]: https://github.com/TsukiNi22/docker-image/commits/ci/v2.0.2/ci.Dockerfile
[ci:v2.0.1]: https://github.com/TsukiNi22/docker-image/commits/ci/v2.0.1/ci.Dockerfile
[ci:v2.0.0]: https://github.com/TsukiNi22/docker-image/commits/ci/v2.0.0/ci.Dockerfile
[ci:v1.3.1]: https://github.com/TsukiNi22/docker-image/commits/ci/v1.3.1/ci.Dockerfile
[ci:v1.3.0]: https://github.com/TsukiNi22/docker-image/commits/ci/v1.3.0/ci.Dockerfile
[ci:v1.2.0]: https://github.com/TsukiNi22/docker-image/commits/ci/v1.2.0/ci.Dockerfile
[ci:v1.1.0]: https://github.com/TsukiNi22/docker-image/commits/ci/v1.1.0/ci.Dockerfile
[ci:v1.0.0]: https://github.com/TsukiNi22/docker-image/commits/ci/v1.0.0/ci.Dockerfile

---

## [unit-tests:Unreleased] (empty)

## [unit-tests:v2.0.0] - 2026-09-22
### Changed
- **[MAJOR]** switch to fedora as root container

## [unit-tests:v1.0.0] - 2026-08-16
### Added
- Initial version of the Unit-Tests image with only basic unit tests tool (Google Tests c++), this image is derived from the `ci` image

[unit-tests:Unreleased]: https://github.com/TsukiNi22/docker-image/commits/main/unit-tests.Dockerfile
[unit-tests:v2.0.0]: https://github.com/TsukiNi22/docker-image/commits/unit-tests/v2.0.0/unit-tests.Dockerfile
[unit-tests:v1.0.0]: https://github.com/TsukiNi22/docker-image/commits/unit-tests/v1.0.0/unit-tests.Dockerfile

---

## [mingw64-ci:Unreleased] (empty)

## [mingw64-ci:v1.1.0] - 2026-10-15
### Fixed
- `rpm-build` added: the RPM packages (`mingw64-libutils*` of libutils) failed with `RPM package requires rpmbuild executable`
- `xstyle` installed with the `setup.sh` of [ai-utils](https://github.com/TsukiNi22/ai-utils) (`install xstyle`), `procps-ng` added for it

### Added
- `mingw64-libutils` & `mingw64-libutils-db` (libutils for windows, optimized & debug, in the mingw sysroot), the linux `libutils` is only used to build `xstyle` then removed

## [mingw64-ci:v1.0.0] - 2026-10-15
### Added
- Initial version of the MinGW64-CI image (windows cross compilation: `mingw64-gcc/g++`, cmake toolchain, `mingw64-openssl`, static winpthreads, `xstyle`), independent from the `ci` image

[mingw64-ci:Unreleased]: https://github.com/TsukiNi22/docker-image/commits/main/mingw64-ci.Dockerfile
[mingw64-ci:v1.1.0]: https://github.com/TsukiNi22/docker-image/commits/mingw64-ci/v1.1.0/mingw64-ci.Dockerfile
[mingw64-ci:v1.0.0]: https://github.com/TsukiNi22/docker-image/commits/mingw64-ci/v1.0.0/mingw64-ci.Dockerfile

---

## [mingw64-unit-tests:Unreleased] (empty)

## [mingw64-unit-tests:v1.0.0] - 2026-10-15
### Added
- Initial version of the MinGW64-Unit-Tests image (Google Tests c++ built for mingw64, `wine` as ctest emulator), this image is derived from the `mingw64-ci` image

[mingw64-unit-tests:Unreleased]: https://github.com/TsukiNi22/docker-image/commits/main/mingw64-unit-tests.Dockerfile
[mingw64-unit-tests:v1.0.0]: https://github.com/TsukiNi22/docker-image/commits/mingw64-unit-tests/v1.0.0/mingw64-unit-tests.Dockerfile

---

> [!WARNING]
> `mingw64-package` is merged into `package` (`package:v2.1.0`) and no longer built

## [mingw64-package:Unreleased] (empty)

## [mingw64-package:v1.0.0] - 2026-10-15
### Added
- Initial version of the MinGW64-Package image (windows installers `NSIS` / `msitools`, `zip`, `osslsigncode`, `mingw64-objdump`), independent from the `package` image

[mingw64-package:Unreleased]: https://github.com/TsukiNi22/docker-image/commits/main/mingw64-package.Dockerfile
[mingw64-package:v1.0.0]: https://github.com/TsukiNi22/docker-image/commits/mingw64-package/v1.0.0/mingw64-package.Dockerfile

---
