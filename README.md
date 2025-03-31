
This repository contains images used for building embedded ARM applications using the official ARM GCC 14.2Rel1
toolchain and Linux applications using the GCC 14 toolchain.

Assuming that you have a build-gcc.sh sh script in the current directory, you would use the command:

```bash
docker run --rm -it -v $(pwd):/home/build rmckaykm/gcc-and-arm-gcc-setup:latest sh build-gcc.sh
```

or in Powershell on windows you can use:

```powershell
docker run --rm -it --volume .:/home/build rmckaykm/gcc-and-arm-gcc-setup:latest sh build-gcc.sh
```

to execute it and provided the script outputs its build artefacts in a subdirectory the outputs will end up in a similar subdirectory of the current directory.
