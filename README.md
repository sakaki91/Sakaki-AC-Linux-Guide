# Assetto Corsa Linux Guide
Sakaki guide to running Assetto Corsa with Mods (CSP) + CM on Linux<br>
[Configuration Used](#configuration-used) | [Dependencies](#dependencies-and-information) | [Installation](#installation) | [Modding](#modding) | [Online](#online)
## Configuration used:

OS: Arch Linux x86_64<br>
Host: H81<br>
Kernel: 6.14.7-arch2-1<br>
Uptime: 12h 10m<br>
Packages: 903 (pacman), 22 (flatpak) <br>
Shell: bash 5.2.37 <br>
Resolution: 1440x900 <br>
DE: Plasma 6.3.5 <br>
WM: kwin <br>
Theme: Breeze-Dark [GTK2], Breeze [GTK3] <br>
Icons: breeze-dark [GTK2/3] <br>
Terminal: konsole <br>
CPU: Intel i5-4590 (4) @ 3.7GHz [36.0°on] <br>
CPU Usage: 31% <br>
GPU: AMD ATI Radeon 540/540X/550/550X / RX 540X/550/550X <br>
GPU Driver: amdgpu <br>
Memory: 8.16GiB / 15.57GiB (52%) <br>
Disk (/): 96G / 233G (44%) <br>

## Dependencies and Information

In this guide, the native Steam from the Arch Linux Multilib repository was used, it will work for .deb and NATIVE variants, this guide needs to be adapted for Flatpak, for Flatpak it works but needs adjustments and conversion of commands or change of directories, soon I will bring a tutorial for Flatpak!

Dependencies: Steam (Native), wine, winetricks<br>
e.g  `$ sudo pacman -S steam wine winetricks%` or `$ sudo apt install steam wine winetricks -y`

## Installation

now you need to install the game, and in the game properties on Steam and select the "Compatibility" tab and then "Force use of the Steam Play Compatibility Tool", and below select the Proton 5.0-10 version, after that click Play, probably the game will not open, it will have a silent Crash, as soon as the Play button appears again, you minimize Steam and open the terminal<br>

when you press play using Proton 5.0 even if the game doesn't open, or crashes, it created a VERY important prefix in the compatdata folder in the Steam folder, usually located at ~/.steam/steam/steamapps/compatdata, inside the compatdata folder the 244210 folder was created and inside it will be the pfx/ folder
you will need to use the WINEPREFIX command to set this 244210/pfx folder so that we can install the game's dependencies, if your game is on another disk or directory the path changes, e.g.: mine is on another disk in the location: *`/run/media/user/mydisk/SteamLibrary/steamapps/compatdata/244210/pfx`*, in this case we would use the command: `$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx`, (or the directory of your created prefix if your game is installed on another disk/directory, this directory that I show is the default one that comes).
#### Many commands here are from my .bash_history, I put it in full here, if some things are already installed or repeat when installing dependencies, no problem, they work!

`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx wine dotnet48 dotnet472 vcrun2015 d3dx9 d3dcompiler_43 corefonts d3dcompiler_47 dotnet452`

`% WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winecfg` with this command you will open winecfg, I recommend changing the "windows version" to: Windows 10, then you click on the libraries tab, type dwrite and then click on add and then click on apply.

then try opening the game via Steam again, if it doesn't open or there is an error it is most likely because of dotnet48, you will need to install it via the offline .exe installer by downloading it from this [link](https://support.microsoft.com/en-us/topic/microsoft-net-framework-4-8-offline-installer-for-windows-9d23f658-3b97-68ab-d013-aa3c3e7495e0)<br>
and to install use the following command: `$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx wine dotnet-file-you-just-downloaded.exe`
If your game is already opening and is playable, you can disregard this part.

after that install the latest version of [Proton GE](https://github.com/GloriousEggroll/proton-ge-custom), and put it to run on steam as the main Proton.

## Modding

Open the Assetto Corsa folder and rename *AssettoCorsa.exe* to *AssettoCorsaBackup.exe*<br>
then download the [Content Manager](https://assettocorsa.club/content-manager.html) and extract it to the main Assetto Corsa folder, and rename Content Manager.exe to Assetto Corsa.exe and open the game via Steam.<br>
then the Content Manager will open, you can configure and modify as you wish, I recommend using version 0.2.0 of the Custom Shaders Patch, avoid very new or very old versions!

## Online

Online mode also works smoothly, both public kunos servers and LAN servers, but it requires some adjustments. On Arch Linux, it didn't need so many adjustments, but if your system has an active Firewall, you will need to approve the Assetto Corsa ports on your firewall, e.g.: `% sudo ufw allow 9600:9700/udp && sudo ufw allow 9600:9700/tcp`, or approve them on your firewall.<br>

and to enter private/LAN servers it is more complicated, you will need to click on the Online > Kunos tabs, and add any server to Favorites, after adding, some new tabs will appear within Online: Favorites, Recent and LAN, you will need to open the server through Content Manager (or if your friend opens it you will need his IP, usually it is in Hamachi or Radmin), but if you open the server, the LAN tab of Content Manager for Linux is broken and does not work, if your friend is on Windows he will see your server open in LAN, but you will not see it, to enter your own server you can type in the terminal: ip addr show, and get your IP that will be saved in the network interface you are connected to, e.g: `*enp4s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
link/ether ########## brd ff:ff:ff:ff:ff:ff 
altname ############ 
inet 192.###.#.#/24* ## This last part where it says inet and some numbers is your IP`<br>
and get your IP and the server is open, click on the favorites tab in Content Manager, and in this tab at the bottom next to the refresh button, you will see the "+" symbol, click on it to add the server, you will need to add it in a specific way to be recognized, for example: *127.0.0.1:9600*<br>
"*127.0.0.1* is an example of an IP, the symbol ":" is used to add the port, and the port is *9600* fixed, you need to add *9600*.", after that click on OK, and the server will appear in the Favorites tab for you to connect, if it does not appear, restart Content Manager and go back to the favorites tab, it will appear.<br>

LONG LIVE LINUX GAMING!
