# Changelog
All notable changes to this project will be documented in this file.

> [!CAUTION]
> All versions start at `1.0.0`. If you don't find an old changelog, see `old-changelog/*.md`

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [git:Unreleased] (empty)

## [git:v1.0.0] - 2026-07-28
### Added
- Initial version of the GIT image with only basic tools (git, wget)

[git:Unreleased]: https://github.com/TsukiNi22/docker-image/commits/main/git.Dockerfile
[git:v1.0.0]: https://github.com/TsukiNi22/docker-image/commits/git/v1.0.0/git.Dockerfile

---

## [package:Unreleased] (empty)

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
[package:v1.2.0]: https://packagehub.com/TsukiNi22/docker-image/commits/package/v1.2.0/package.Dockerfile
[package:v1.1.0]: https://packagehub.com/TsukiNi22/docker-image/commits/package/v1.1.0/package.Dockerfile
[package:v1.0.0]: https://packagehub.com/TsukiNi22/docker-image/commits/package/v1.0.0/package.Dockerfile

---

## [ci:Unreleased] (empty)

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
[ci:v1.3.0]: https://github.com/TsukiNi22/docker-image/commits/ci/v1.3.0/ci.Dockerfile
[ci:v1.2.0]: https://github.com/TsukiNi22/docker-image/commits/ci/v1.2.0/ci.Dockerfile
[ci:v1.1.0]: https://github.com/TsukiNi22/docker-image/commits/ci/v1.1.0/ci.Dockerfile
[ci:v1.0.0]: https://github.com/TsukiNi22/docker-image/commits/ci/v1.0.0/ci.Dockerfile

---

## [unit-tests:Unreleased] (empty)

## [unit-tests:v1.0.0] - 2026-08-16
### Added
- Initial version of the Unit-Tests image with only basic unit tests tool (Google Tests c++), this image is derived from the `ci` image

[unit-tests:Unreleased]: https://github.com/TsukiNi22/docker-image/commits/main/unit-tests.Dockerfile
[unit-tests:v1.0.0]: https://github.com/TsukiNi22/docker-image/commits/unit-tests/v1.0.0/unit-tests.Dockerfile

---
