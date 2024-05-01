# Introduction
Descent 1 & 2 using DXX-Rebirth, ported to retro handhelds. Runs via [PortMaster](https://portmaster.games). Shareware demo files included; you can provide your own full game version.

Latest PortMaster version built from commit [b5ca993](https://github.com/dxx-rebirth/dxx-rebirth/commit/b5ca993d71739e9542fafe13d7332cc6ce008cc5) for aarch64. Cmpatibility binary built from commit [e1d68f5](https://github.com/JeodC/dxx-rebirth/commit/e1d68f58ab6a2fe43eb011555ab9a1582d523bab) and compatibility fix [c22de97](https://github.com/JeodC/dxx-rebirth/commit/c22de974133f407e6413dafde8c0769019881fec).

# Add-On Files
Add-On files allow you to customize DXX-Rebirth to your liking. You might prefer certain soundcard midi audio, or even the PS1 soundtrack.
To use an add-on, simply drop the .dxa file into the `descent/data` folder. These dxa files are just .zip files, so you can open them and modify however you like.

There are several soundtrack addons to choose from as well as missions.  

Some of these files are large and are therefore split into archive parts. Use something like 7zip to unarchive them.

## Additional Add-Ons
Missions can be found and downloaded from [Descent Mission Archive](https://sectorgame.com/dxma/).

# Building from source dxx-rebirth

## Install dependencies
```
apt -y install build-essential git wget python3 python3-pip python3-setuptools python3-wheel scons libglu1-mesa-dev pkg-config libpng-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libphysfs-dev libgles1
ln -s /usr/lib/aarch64-linux-gnu/libGLESv1_CM.so /usr/lib/aarch64-linux-gnu/libGLES_CM.so
```

## Install and build dxx-rebirth
1. 	`git clone https://github.com/dxx-rebirth/dxx-rebirth` // `git clone --branch compatibility https://github.com/JeodC/dxx-rebirth` (Use the compatibility version for GLIBC versions < 2.36)
```
cd dxx-rebirth
scons -j$(nproc) sdl2=1 sdlmixer=1 opengles=1
cd build
strip d1x-rebirth/d1x-rebirth
strip d2x-rebirth/d2x-rebirth
```

Retrieve your build from `dxx-rebirth\build`
