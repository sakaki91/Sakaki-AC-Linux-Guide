# Assetto Corsa Linux Guide - Unstable, currently developing fixes! (update scheduled for 8pm (June 10)
Sakaki guide to running Assetto Corsa with Mods (CSP) + CM on Linux<br>
[Configuration Used](#configuration-used) | [Dependencies](#dependencies-and-information) | [Installation](#installation) | [Modding](#modding) | [Online](#online)
## Configuration used:

OS: Arch Linux x86_64<br>
Host: H81<br>
Kernel: 6.15.1-arch1-2<br>
Uptime: 2 hours, 17 mins<br>
Packages: 858 (pacman), 7 (flatpak)<br>
Shell: bash 5.2.37<br>
Resolution: 1440x900<br>
DE: GNOME 48.2<br>
WM: Mutter<br>
WM Theme: Adwaita<br>
Theme: Adwaita [GTK2/3]<br>
Icons: Adwaita [GTK2/3]<br>
Terminal: kgx<br>
CPU: Intel i5-4590 (4) @ 3.700GHz<br>
GPU: AMD ATI Radeon 540/540X/550/550X / RX 540X/550/550X<br>
Memory: 6962MiB / 15941MiB<br>

## Dependencies and Information

In this guide, the native Steam from the Arch Linux MULTILIB repository was used, it will work for .deb and NATIVE variants, this guide needs to be adapted for Flatpak, for Flatpak it works but needs adjustments and conversion of commands or change of directories, soon I will bring a tutorial for Flatpak!

Dependencies: Steam (Native), wine, winetricks<br>
e.g  `$ sudo pacman -S steam wine winetricks` or `$ sudo apt install steam wine winetricks -y`

## Installation

<p>(IMPORTANT) - If you have already tried to run the game on Linux, I strongly recommend that you delete the game prefix (usually in ~/.steam/steam/steamapps/compatdata/244210/) and you must delete the winetricks cache with `$ rm -rf ~/.cache/winetricks` (if you have never used it, you do not need to delete it), and from there you can follow the tutorial below.</p>
<p>The game was tested and run on Arch Linux x86_64, the game was tested several times looking for defects and debugging the crashes, with this guide it is 100% certain that you will be able to run the game (on Arch Linux at least), a while ago I tested it on Linux Mint too, in a similar way, I believe the guide will also work for Ubuntu/Debian-like too, but I found problematic distros to run the game, I tried Fedora 42 but I was not successful in running the game, soon I will look for the appropriate solutions for these other popular distros, and I will find a way to run Assetto Corsa using the Steam Flatpak too soon!</p>

<p>now you need to install the game, and in the game properties on Steam and select the "Compatibility" tab and then "Force use of the Steam Play Compatibility Tool", and below select the Proton 5.0-10 version, after that click Play, probably the game will not open, it will have a silent Crash, as soon as the Play button appears again, you minimize Steam and open the terminal</p>

<p>when you press play using Proton 5.0 even if the game doesn't open, or crashes, it created a VERY important prefix in the compatdata folder in the Steam folder, usually located at ~/.steam/steam/steamapps/compatdata, inside the compatdata folder the 244210 folder was created and inside it will be the pfx/ folder
you will need to use the WINEPREFIX command to set this 244210/pfx folder so that we can install the game's dependencies, if your game is on another disk or directory the path changes, e.g.: mine is on another disk in the location: *`/run/media/user/mydisk/SteamLibrary/steamapps/compatdata/244210/pfx`*, in this case you will use the following commands:</p>

`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks dotnet48`<br>
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks d3dcompiler_47`<br>
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks vcrun2015`<br>
<br>
`% WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winecfg` with this command you will open winecfg, I recommend changing the "windows version" to: Windows 10, then you click on the libraries tab, type dwrite and then click on add and then click on apply.

after that install the latest version of [Proton GE](https://github.com/GloriousEggroll/proton-ge-custom), and put it to run on steam as the main Proton.

It is common for the game or content manager to produce some errors when installing dependencies or when trying to open them, but know that this is part of it, and does not prevent the game from running! [e.g](https://github.com/vitorserveja/Sakaki-AC-Linux-Guide/prints/)

## Modding

Open the Assetto Corsa folder and rename *AssettoCorsa.exe* to *AssettoCorsaBackup.exe*<br>
then download the [Content Manager](https://assettocorsa.club/content-manager.html) and extract it to the main Assetto Corsa folder, and rename *Content Manager.exe* to *AssettoCorsa.exe* and open the game via Steam.<br>
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
