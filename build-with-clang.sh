#!/bin/sh

docker build -t rmckaykm/clang-and-arm-gcc:latest -f src/Dockerfile-with-clang .

#docker run --rm -it -V $(pwd):/home/build rmckaykm/gcc-10host-arm:latest apt list --installed
