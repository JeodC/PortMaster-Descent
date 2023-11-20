# Descent 1/2 For PortMaster
The MS-DOS games by Parallax Software ported with DXX-Rebirth v0.61.

![image](https://github.com/JeodC/Portmaster-Descent/assets/47716344/c7d3295f-d3bc-4735-ae25-c70224304012)

## Installation
Unzip to ports folder e.g. ```/roms/ports/```. Ready to play with shareware and demo files. To upgrade to full game, purchase on Steam/GOG and then add .hog and .pig files to descent/data and descent2/data.

Filelist for full versions:  
├── descent/data  
│   ├── missions/    
│   │ └── bonuscontent   
│   └── descent.hog  
│   └── descent.pig  
│   └── chaos.hog (multiplayer, optional)  
│   └── chaos.msn (multiplayer, optional)  
├── descent2/data  
│   ├── missions/    
│   │ └── bonuscontent   
│   └── alien1.pig  
│   └── alien2.pig  
│   └── descent2.ham  
│   └── descent2.hog  
│   └── descent2.s11  
│   └── descent2.s22  
│   └── fire.pig  
│   └── groupa.pig  
│   └── ice.pig  
│   └── water.pig  
│   └── intro-h.mvl (optional)  
│   └── other-h.mvl (optional)  
│   └── robots-h.mvl (optional)  

Descent I & II: Definitive Edition came with some extra content not available on GOG or Steam. These include Levels of the World (Descent 1), 29 Bonus Levels by Parallax Software (Descent 1), and the Descent 2: Vertigo expansion pack. This extra content can be placed in the data/missions folder for both Descent and Descent 2. If done correctly you'll see a new submenu when selecting New Game.

<img src="https://github.com/JeodC/Portmaster-Descent/assets/47716344/2bb314e7-6365-458e-9568-739c31eef983" width="300" height="300"/>

## Configuration
Addon sound files are in the data folders for both games. These files (sc55 and opl3) are both available on the dxx-rebirth website. dxxr-sc55-music.dxa is used by default. To use the opl3 file instead,
add a file extension to the sc55-music file like ```d1xr-sc55-music.dxa.bak```.

Ini files d1x.ini and d2x.ini are configurable. It is recommended to not touch the Controls section of the ini files.

GPtoKeyB is used instead of SDL Joystick controls. Keys can be configured by opening the descent.gptk file in a text editor. The file is commented with the default KBM controls to make modification easier.

A branch exists for SDL controls for those who prefer it.

## Default Controls

| Button | Action |
|--|--| 
|A|Fire Flare|
|B|Reverse|
|X|Forward|
|Y|Deploy Bomb|
|L1|Primary Fire|
|L2|Scroll Primary Weapon|
|L3|Not Set|
|R1|Secondary Fire|
|R2|Scroll Secondary Weapon|
|R3|Not Set|
|D-PAD UP|Up|
|D-PAD DOWN|Down|
|D-PAD LEFT|Left|
|D-PAD RIGHT|Right|
|LEFT ANALOG|Look / Camera|
|RIGHT ANALOG UP|Accept / Fire Secondary Weapon|
|RIGHT ANALOG DOWN|Accept|
|RIGHT ANALOG LEFT/RIGHT|Bank Left / Right|
|SELECT|Back / Escape|
|START|Accept|

## To-Do: QoL Changes 
[ ] GPToKeyB allow user to scroll through letters to create profile name and enter numbers for level select  
[x] Hotkeys to skip movies (Descent 2 intro)  
[ ] Cheats...somehow  

## Contributing
Pull requests welcome. Testing ongoing in <a href="https://discord.gg/FDg86YtReQ">PortMaster Discord</a>.

Since DXX-Rebirth is used as the wrapper for the games, you may encounter some bugs in gameplay that are beyond our control. Please use the <a href="https://github.com/dxx-rebirth/dxx-rebirth">DXX-Rebirth Github Repo</a> to track and report issues.

## Thanks
dfreivald for the original port structure  
Cebion for help in meeting portmaster standards  
Testers from the PortMaster Discord  
Parallax Software for the fantastic games  
<a href="https://www.dxx-rebirth.com/">DXX-Rebirth</a> Team for the fantastic wrapper (and screenshots)  
