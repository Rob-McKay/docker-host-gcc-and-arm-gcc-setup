#!/bin/sh

docker build -t rmckaykm/gcc-and-arm-gcc-and-clang-tidy:latest -f src/Dockerfile-with-clang-tidy .

#docker run --rm -it -V $(pwd):/home/build rmckaykm/gcc-10host-arm:latest apt list --installed
