#!/bin/bash

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
elif [ -d "$XDG_DATA_HOME/PortMaster/" ]; then
  controlfolder="$XDG_DATA_HOME/PortMaster"
else
  controlfolder="/roms/ports/PortMaster"
fi

source $controlfolder/control.txt
source $controlfolder/device_info.txt
[ -f "${controlfolder}/mod_${CFW_NAME}.txt" ] && source "${controlfolder}/mod_${CFW_NAME}.txt"
get_controls

GAMEDIR="/$directory/ports/descent"
DEVICE_ARCH="${DEVICE_ARCH:-aarch64}"
GAME="d1x-rebirth"

cd $GAMEDIR

if [ -f "${controlfolder}/libgl_${CFW_NAME}.txt" ]; then 
  source "${controlfolder}/libgl_${CFW_NAME}.txt"
else
  source "${controlfolder}/libgl_default.txt"
fi

$ESUDO rm -rf ~/.$GAME
ln -sfv $GAMEDIR/config ~/.$GAME

export LD_LIBRARY_PATH="$GAMEDIR/libs.$DEVICE_ARCH:$LD_LIBRARY_PATH"
export SDL_FORCE_SOUNDFONTS=1
export SDL_SOUNDFONTS="$GAMEDIR/soundfont.sf2"

# Add some cheats
if [ ! -f "./cheats.txt" ]; then
	echo "Error: Cheats file not found. No cheats will be used." > /dev/tty0
else
	CHEATS=$(sed -n -E '/^[^#]*=[[:space:]]*1([^0-9#]|$)/s/(=[[:space:]]*1[^0-9#]*)//p' ./cheats.txt | tr -d '\n')
fi

export TEXTINPUTPRESET=$CHEATS

# Calculate greatest common divisor (GCD) to simplify aspect ratio
gcd() {
  dividend=$1
  divisor=$2
  remainder=1
  until [ "$remainder" -eq 0 ]; do
    remainder=$((dividend % divisor))
    dividend=$divisor
    divisor=$remainder
  done
  echo $dividend
}

# Calculate greatest common divisor of width and height
GCD=$(gcd $DISPLAY_WIDTH $DISPLAY_HEIGHT)

# Calculate simplified aspect ratio
ASPECT_X=$((DISPLAY_WIDTH / GCD))
ASPECT_Y=$((DISPLAY_HEIGHT / GCD))

# Edit .cfg file with updated resolution and aspect ratio
sed -i "s/^ResolutionX=640/ResolutionX=$DISPLAY_WIDTH/g" $GAMEDIR/config/descent.cfg
sed -i "s/^ResolutionY=480/ResolutionY=$DISPLAY_HEIGHT/g" $GAMEDIR/config/descent.cfg
sed -i "s/^AspectX=.*/AspectX=$ASPECT_Y/g" $GAMEDIR/config/descent.cfg
sed -i "s/^AspectY=.*/AspectY=$ASPECT_X/g" $GAMEDIR/config/descent.cfg

# Setup controls
$ESUDO chmod 666 /dev/tty1
$ESUDO chmod 666 /dev/uinput

if [ $CFW_NAME == "ArkOS" ]; then
	$GPTOKEYB "$GAME.compat" -c "config/joy.gptk" & 
	SDL_GAMECONTROLLERCONFIG="$sdl_controllerconfig"
	./$GAME.compat -hogdir data
else
	$GPTOKEYB "$GAME.$DEVICE_ARCH" -c "config/joy.gptk" & 
	SDL_GAMECONTROLLERCONFIG="$sdl_controllerconfig"
	./$GAME.$DEVICE_ARCH -hogdir data
fi

$ESUDO kill -9 $(pidof gptokeyb)
$ESUDO systemctl restart oga_events & 
printf "\033c" >> /dev/tty1
