#FROM ubuntu:latest
ARG BUILDKIT_SBOM_SCAN_CONTEXT=true
FROM ubuntu:24.04

ENV ARM_GCC_PATH=/opt/gcc-arm-none-eabi
ARG ARM_GCC_VER=14.2.rel1
ARG CMAKE_VER=3.31.6
ARG HOST_GCC_VER=14

#ARG USERNAME=gcc_user
#ARG USER_UID=9100
#ARG USER_GID=$USER_UID

LABEL Description="Image for building and debugging arm-embedded projects using the GCC ${ARM_GCC_VER} ARM toolchain which also has the host gcc-${HOST_GCC_VER} toolchain installed. Includes CMake ${CMAKE_VER} and Python 3"
LABEL maintainer="Rob McKay"

RUN apt-get update && apt install -y ca-certificates 

# wget is needed to get the toolchain

RUN apt-get update && \
    apt-get install -y -f libc6-dev --no-install-recommends && \
    apt-get install -y -f \
        bc \
        binutils \
        binutils-common \
        bison \
        build-essential \
        bzip2 \
        flex \
        gcc-${HOST_GCC_VER} \
        libssl-dev \
        ninja-build \
        python3 \
        python3-pip \
        pylint \
        wget \
        zip \
        manpages- manpages-dev- --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
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

# Create the user
#RUN groupadd --gid $USER_GID $USERNAME \
#    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# Set the user to the new user
#USER $USERNAME

# add the tools to the path
ENV PATH="/opt/cmake-${CMAKE_VER}-linux-x86_64/bin:$ARM_GCC_PATH/bin:${PATH}"
WORKDIR /home/build
