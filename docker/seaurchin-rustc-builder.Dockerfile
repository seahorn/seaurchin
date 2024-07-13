# SeaHorn builder image that builds binary SeaHorn release package
# Primarily used by the CI
# Arguments:
#  - BASE-IMAGE: jammy-llvm18
#  - BUILD_TYPE: Debug, RelWithDebInfo, Coverage
#ARG BASE_IMAGE=jammy-llvm18
#FROM buildpack-deps:$BASE_IMAGE
FROM buildpack-deps-seaurchin

WORKDIR /seaurchin
RUN mkdir rust
# Assume that docker-build is ran in the top-level SeaHorn directory
COPY . /seaurchin/rust
WORKDIR /seaurchin/rust 
RUN ./x.py build
WORKDIR /seaurchin
