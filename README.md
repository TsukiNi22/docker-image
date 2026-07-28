# Docker Images

This repository contains Docker images for development and CI/CD.

> [!IMPORTANT]
> All exemple/explication are using `ci.Dockerfile`

## Repository Content

```
ghcr.io/tsukini22/git:latest # git
ghcr.io/tsukini22/ci:latest  # clang -> c/c++ with cmake & make
```

## Included tools

| Image | Tools |
| ----- | ----- |
| `git:latest` | `git`, `wget` |
| `ci:latest` | `clang/clang++ (18)`, `ccache`, `cmake`, `make`, `git`, `pkg-config`, `python3`, `wget` |

## Status
| Name + Link | Version | Last Update | Status |
| ----------- | ------- | ----------- | ------ |
| [git][git-link] | ![Version][git-version] | ![Update][git-update] | ![Build Image - GIT][git-build] |
| [ci][ci-link] | ![Version][ci-version] | ![Update][ci-update] | ![Build Image - CI][ci-build] |

[git-link]: https://github.com/TsukiNi22/docker-image/pkgs/container/git
[git-version]: https://ghcr-badge.egpl.dev/tsukini22/git/latest_tag?trim=major&label=latest
[git-update]: https://img.shields.io/github/last-commit/TsukiNi22/docker-image?path=git.Dockerfile
[git-build]: https://github.com/TsukiNi22/docker-image/actions/workflows/build-image-git.yml/badge.svg

[ci-link]: https://github.com/TsukiNi22/docker-image/pkgs/container/ci
[ci-version]: https://ghcr-badge.egpl.dev/tsukini22/ci/latest_tag?trim=major&label=latest
[ci-update]: https://img.shields.io/github/last-commit/TsukiNi22/docker-image?path=ci.Dockerfile
[ci-build]: https://github.com/TsukiNi22/docker-image/actions/workflows/build-image-ci.yml/badge.svg

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
