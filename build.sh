#!/bin/sh

docker build -t rmckaykm/gcc-10host-arm:latest -f src/Dockerfile .

#docker run --rm -it -V $(pwd):/home/build rmckaykm/gcc-10host-arm:latest apt list --installed
