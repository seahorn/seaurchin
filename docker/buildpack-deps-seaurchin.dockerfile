#
# seaurchin-llvm build image. Contains all the necessary dependencies
# to build seaurchin-llvm. 
# Used by the CI to start the build
#

ARG BASE_IMAGE=jammy-scm
# Base image with usual build dependencies
FROM buildpack-deps:$BASE_IMAGE

# Install dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
  apt-get install -yqq software-properties-common && \
  apt-get update && \
  apt-get upgrade -yqq && \
  apt-get install -yqq cmake cmake-data unzip \
      zlib1g-dev \
      ninja-build libgraphviz-dev \
      libboost1.74-dev \
      python3-pip \
      less vim \
      gcc-multilib \
      sudo \
      graphviz libgraphviz-dev python3-pygraphviz \
      lcov gcovr rsync lld && \
  pip3 install lit OutputCheck && \
  pip3 install networkx && \
  pip3 install cmake --upgrade && \
  mkdir seaurchin-llvm
RUN wget -qO- https://apt.llvm.org/llvm.sh | bash -s -- 18

WORKDIR /seaurchin-llvm