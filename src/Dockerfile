FROM ubuntu:latest

ENV ARM_GCC_PATH=/opt/gcc-arm-none-eabi
ARG ARM_GCC_VER=13.2.rel1
ARG CMAKE_VER=3.27.8

LABEL Description="Image for building and debugging arm-embedded projects using the GCC ${ARM_GCC_VER} ARM toolchain which also has the host gcc-12 toolchain installed. Includes CMake ${CMAKE_VER}"
LABEL maintainer="Rob McKay"

RUN apt-get update && apt install -y ca-certificates 

# wget is needed to get the toolchain

RUN apt-get update && \
    apt-get install -y -f libc6-dev --no-install-recommends && \
    apt-get install -y -f gcc-12 ninja-build wget bzip2 binutils binutils-common bison flex bc build-essential zip libssl-dev manpages- manpages-dev- --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
    cpan install Digest::CRC

WORKDIR /opt
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VER}/cmake-${CMAKE_VER}-linux-x86_64.sh -O cmake-linux-x86_64.sh -q --no-check-certificate && \
    chmod +x cmake-linux-x86_64.sh && \
    ./cmake-linux-x86_64.sh  --prefix=/opt --include-subdir --skip-licence && \
    rm cmake-linux-x86_64.sh

# Adding git bloats the image by 95MB
# RUN apt-get install -y git

# get the toolchain
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_GCC_VER}/binrel/arm-gnu-toolchain-${ARM_GCC_VER}-x86_64-arm-none-eabi.tar.xz -O gcc-arm-none-eabi.tar.xz -q --no-check-certificate && \
    mkdir $ARM_GCC_PATH && \
    tar xf gcc-arm-none-eabi.tar.xz -C $ARM_GCC_PATH --strip-components 1 && \
    rm gcc-arm-none-eabi.tar.xz && \
    rm -rf $ARM_GCC_PATH/share/doc/ $ARM_GCC_PATH/share/gcc-arm-none-eabi/samples/

# add the tools to the path
ENV PATH="/opt/cmake-3.24.2-linux-x86_64/bin:$ARM_GCC_PATH/bin:${PATH}"
WORKDIR /home/build
