#!/bin/sh

docker build -t rmckaykm/gcc-and-arm-gcc-setup:2204LTS -f src/Dockerfile .

#docker run --rm -it -V $(pwd):/home/build rmckaykm/gcc-10host-arm:latest apt list --installed
