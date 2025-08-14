#!/bin/sh

#docker build -t rmckaykm/clang:latest -f src/Dockerfile-clang .

docker build -t rmckaykm/clang-zs:latest -f src/Dockerfile-clang-zs .

#docker run --rm -it -V $(pwd):/home/build rmckaykm/clang:latest apt list --installed
