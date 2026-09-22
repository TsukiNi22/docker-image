FROM ghcr.io/tsukini22/ci:latest

RUN dnf install -y \
    # Unit tests building
    gtest-devel \
    gmock-devel \

    # Cleaning
    && dnf clean all
