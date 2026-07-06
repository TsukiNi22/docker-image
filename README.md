# Docker Images

This repository contains Docker images for development and CI/CD.

> [!IMPORTANT]
> All exemple/explication are using `ci.Dockerfile`

## Repository Content

```
ghcr.io/tsukini22/ci:latest # clang -> c/c++ with cmake & make
```

## Included tools

| Image | Tools |
| ----- | ----- |
| `ci:lastest` | `clang/clang++ (18)`, `ccache`, `cmake`, `make`, `git`, `pkg-config`, `python3` |

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

You can verify the image:

```bash
docker run --rm -it ci:latest clang++ --version
docker run --rm -it ci:latest cmake --version
```

## Publish to GitHub Container Registry (GHCR)

Tag the image:

```bash
docker tag ci:latest ghcr.io/tsukini22/ci:latest
```

Authenticate with GitHub Container Registry:

```bash
echo <YOUR_GITHUB_TOKEN> | docker login ghcr.io -u <YOUR_GITHUB_USERNAME> --password-stdin
```

Push the image:

```bash
docker push ghcr.io/tsukini22/ci:latest
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
