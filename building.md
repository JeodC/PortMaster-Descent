# Introduction
This is a guide for building dxx-rebirth from source for RK3326 devices using Windows Subsystem for Linux. This guide works as of 12/30/2023.

# Building

## Install WSL and chroot
1. 	Install wsl and ubuntu (use wsl2)
2. 	```sudo apt update```
3.	```sudo apt install -y apt-transport-https ca-certificates curl software-properties-common```
4.	```curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -```
5.	```sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"```
6.	```sudo apt install docker-ce -y```
7.	```sudo docker run --rm --privileged multiarch/qemu-user-static --reset -p yes```
8.	```sudo qemu-debootstrap --arch arm64 bookworm /mnt/data/arm64 http://deb.debian.org/debian/```

Note: Bookworm uses gcc-12. For compatibility with older systems such as ArkOS, use bullseye and modify the dxx-rebirth source code.
Note: The folder /mnt/data/arm64 can be modified, for example to /mnt/data/bookworm-arm64. This is useful if you like to maintain multiple chroots.

## Enter chroot and install essentials
1. 	```sudo chroot /mnt/data/arm64/```
2. 	```apt -y install build-essential git wget libdrm-dev python3 python3-pip python3-setuptools python3-wheel ninja-build libopenal-dev premake4 autoconf libevdev-dev ffmpeg libglu1-mesa-dev libsnappy-dev libboost-tools-dev magics++ libboost-thread-dev libboost-all-dev pkg-config zlib1g-dev libpng-dev libsdl2-dev clang cmake cmake-data libarchive13 libcurl4 libfreetype6-dev librhash0 libuv1 mercurial mercurial-common libgbm-dev libsdl2-ttf-2.0-0 libsdl2-ttf-dev```
3. 	```apt -y install scons libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libphysfs-dev```

## Install and build dxx-rebirth
1. 	```git clone https://github.com/dxx-rebirth/dxx-rebirth```
2. 	```cd dxx-rebirth```
3. 	```scons sdl2=1 sdlmixer=1 opengl=1```

Retrieve your build from \\wsl.localhost\Ubuntu\mnt\data\arm64\dxx-rebirth\build

### Optional Steps
4. 	```cd build```
5. 	```strip d1x-rebirth / strip d2sx-rebirth```