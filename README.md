# Introduction
Descent 1 & 2 using DXX-Rebirth, ported to RK3326 and RK3566 devices. Runs via [PortMaster](https://portmaster.games).

# Add-On Files
Add-On files allow you to customize DXX-Rebirth to your liking. You might prefer certain soundcard midi audio, or even the PS1 soundtrack.
To use an add-on, simply drop the .dxa file into the `descent/data` folder. These dxa files are just .zip files, so you can open them and modify however you like.

Some of these files are large and are therefore split into archive parts. Simply use something like 7zip to unarchive them.

## Descent 1 Add-Ons
| Description | File |  
|--|--| 
|SC-55 MIDI|d1xr-sc55-music.dxa|  
|OPL3 MIDI|d1xr-opl3-music.dxa|  
|AWE32 MIDI|d1midi-awe32.dxa|  
|AWE64 MIDI|d1midi-awe64.dxa|  
|Ensoniq 2M MIDI|d1midi-ensoniq2m.dxa|  
|Ensoniq 8M MIDI|d1midi-ensoniq8m.dxa|  
|Roland SC MIDI|d1midi-rolandsc.dxa|  
|Finn's MIDI|d1midi-finn.dxa|  
|Mac CD Redbook Audio|d1cda-mac.dxa|  
|PS1 Soundtrack|d1-playstation.dxa|

## Descent 2 Add-Ons
| Description | File |  
|--|--| 
|SC-55 MIDI|d2xr-sc55-music.dxa|  
|OPL3 MIDI|d2xr-opl3-music.dxa|  
|AWE32 MIDI|d2midi-awe32.dxa|  
|AWE64 MIDI|d2midi-awe64.dxa|  
|Ensoniq 2M MIDI|d2midi-ensoniq2m.dxa|  
|Ensoniq 8M MIDI|d2midi-ensoniq8m.dxa|  
|Roland SC MIDI|d2midi-rolandsc.dxa|  
|Finn's MIDI|d2midi-finn.dxa|  
|Mac CD Redbook Audio|d2cda-mac.dxa|  
|Descent Maximum CD Audio|d2cda-max.dxa|  
|The Definitive Collection Audio|d2cda-tdc.dxa|  
|Descent Maximum|d2xr-maximum.dxa|  

### Descent Maximum
Descent Maximum is the PS1 version of Descent 2. Rather than a straight port, it contains 36 new levels.
It is a total conversion mod for the Descent 2 campaign. To revert to the PC campaign, just delete the .dxa file.

## Additional Add-Ons
Missions can be found and downloaded from [Descent Mission Archive](https://sectorgame.com/dxma/)

# Building from source dxx-rebirth

## Install WSL and chroot
1. 	Install wsl and ubuntu (use wsl2)
2. 	`sudo apt update`
3.	`sudo apt install -y apt-transport-https ca-certificates curl software-properties-common`
4.	`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
5.	`sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`
6.	`sudo apt install docker-ce -y`
7.	`sudo docker run --rm --privileged multiarch/qemu-user-static --reset -p yes`
8.	`sudo qemu-debootstrap --arch arm64 bookworm /mnt/data/arm64 http://deb.debian.org/debian/`

Note: Bookworm uses gcc-12. For compatibility with older systems such as ArkOS, use bullseye and modify the dxx-rebirth source code.  

Note: The folder `/mnt/data/arm64` can be modified, for example to `/mnt/data/bookworm-arm64`. This is useful if you like to maintain multiple chroots.

## Enter chroot and install dependencies
1. 	`sudo chroot /mnt/data/arm64/`
2. 	`apt -y install build-essential git wget python3 python3-pip python3-setuptools python3-wheel scons libglu1-mesa-dev pkg-config libpng-dev libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libphysfs-dev`

## Install and build dxx-rebirth
1. 	`git clone https://github.com/dxx-rebirth/dxx-rebirth` // `git clone https://github.com/JeodC/dxx-rebirth-compat` (Use the compat version for ArkOS etc)
2. 	`cd dxx-rebirth`
3. 	`scons sdl2=1 sdlmixer=1 opengl=1`

Retrieve your build from `\\wsl.localhost\Ubuntu\mnt\data\arm64\dxx-rebirth\build`

### Optional Steps
4. 	`cd build`
5. 	`strip d1x-rebirth / strip d2sx-rebirth`