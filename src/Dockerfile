FROM ubuntu:latest

ENV ARM_GCC_PATH=/opt/gcc-arm-none-eabi

LABEL Description="Image for building and debugging arm-embedded projects using the GCC ARM toolchain (gcc-arm-none-eabi-10-2020-q4-major)"
LABEL maintainer="Rob McKay"

# wget is needed to get the toolchain

RUN add-apt-repository ppa:ubuntu-toolchain-r/ppa \
    apt-get update && \
    apt-get install -qq -y ninja-build wget bzip2 binutils binutils-common make gcc-10 g++-10\
        gcc- gcc-8- cpp- cpp-8- manpages- linux-libc-dev- manpages-dev- --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget https://github.com/Kitware/CMake/releases/download/v3.20.1/cmake-3.20.1-linux-x86_64.sh -O cmake-3.20.1-linux-x86_64.sh -q --no-check-certificate && \
    chmod +x cmake-3.20.1-linux-x86_64.sh && \
    printf "y\ny\n" | ./cmake-3.20.1-linux-x86_64.sh && \
    rm cmake-3.20.1-linux-x86_64.sh

# Adding git bloats the image by 95MB
# RUN apt-get install -y git

# get the toolchain
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 -O gcc-arm-none-eabi.tar.bz2 -q --no-check-certificate && \
    mkdir $ARM_GCC_PATH && \
    tar xjf gcc-arm-none-eabi.tar.bz2 -C $ARM_GCC_PATH --strip-components 1 && \
    rm gcc-arm-none-eabi.tar.bz2 && \
    rm -rf $ARM_GCC_PATH/share/doc/ $ARM_GCC_PATH/share/gcc-arm-none-eabi/samples/
    
# add the tools to the path
ENV PATH="/opt/cmake-3.20.1-linux-x86_64/bin:$ARM_GCC_PATH/bin:${PATH}"
WORKDIR /home/build
