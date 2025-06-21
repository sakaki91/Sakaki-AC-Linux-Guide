# Assetto Corsa Linux Guide - Stable 0.3_1
Sakaki guide to running Assetto Corsa with Mods (CSP) + CM on Linux<br>

- [Dependencies](#dependencies-and-information)
- [Installation](#installation)
  - [Manual](#manual)
  - [Native](#native)
  - [Flatpak](shortly)
- [Modding](#modding)
- [Online](#online)
- [Configuration Used](#configuration-used)

> [!IMPORTANT]
> The guide is only stable for Arch Linux and derivatives and Linux Mint (Tested on 20/06/2025), I am currently exploring LMDE and it is working but it is still experimental, I will look for stability and then I will try to adapt it to Fedora with wine-staging

Recommended Installation: [Manual](#manual), because besides being intuitive, you will most likely learn how WINEPREFIX, wine and winetricks work and the like!<br>
The installation script is not yet as stable as the guide itself, but I promise to improve this over time!

## Dependencies and Information

In this guide, the native Steam from the Arch Linux MULTILIB repository was used, and Wine-Stable(wine-10.8 [Arch Linux]) and Wine-Stable(wine-8.0 [Debian 8.0~repack-4]) and Winetricks, it will work for .deb and NATIVE variants, this guide needs to be adapted for Flatpak, for Flatpak it works but needs adjustments and conversion of commands or change of directories, soon I will bring a tutorial for Flatpak!

**Dependencies**: Steam (Native), wine, winetricks, ruby, gem and wine-mono (Thanks to @Nicodemus on [protonDB](https://www.protondb.com/app/244210) for the help and feedback on installing wine-mono!), install wine-mono if you can't open the game with the settings below<br>
e.g:<br>
`$ sudo pacman -S steam wine winetricks ruby && sudo gem install colorize fileutils`<br>
or<br>
`$ sudo apt install steam wine winetricks ruby -y && sudo gem install colorize fileutils`
<br><br>
## Installation:
### Manual
> [!IMPORTANT]
> If you have already tried to run the game on Linux, I strongly recommend that you delete the game prefix (usually in ~/.steam/steam/steamapps/compatdata/244210/)
> You also must delete the winetricks cache with `$ rm -rf ~/.cache/winetricks` (if you have never used it, you do not need to delete it), and from there you can follow the tutorial below.

<p>The game was tested and run on Arch Linux x86_64 and Linux Mint 22.1, the game was tested several times looking for defects and debugging the crashes, with this guide it is 100% certain that you will be able to run the game, in a similar way, I believe the guide will also work for Ubuntu/Debian-like too, but I found problematic distros to run the game, I tried Fedora 42 but I was not successful in running the game, soon I will look for the appropriate solutions for these other popular distros, and I will find a way to run Assetto Corsa using the Steam Flatpak too soon!</p>

<p>Now you need to install the game, and in the game properties on Steam and select the "Compatibility" tab and then "Force use of the Steam Play Compatibility Tool", and below select the **Proton 5.0-10** version, after that click Play, probably the game will not open, it will have a silent Crash, as soon as the Play button appears again, you minimize Steam and open the terminal</p>

<p>When you press play using Proton 5.0 even if the game doesn't open, or crashes, it created a VERY important prefix in the compatdata folder in the Steam folder, usually located at ~/.steam/steam/steamapps/compatdata, inside the compatdata folder the 244210 folder was created and inside it will be the pfx/ folder
you will need to use the WINEPREFIX command to set this 244210/pfx folder so that we can install the game's dependencies</p>

> [!NOTE]
> If your game is on another disk or directory the path changes, e.g.: mine is on another disk in the location: `/run/media/user/mydisk/SteamLibrary/steamapps/compatdata/244210/pfx`, in this case you should replace the directory to that in the other disk.</p>

`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks dotnet48`<br>
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks d3dcompiler_47`<br>
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks vcrun2015`<br>
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks dxvk`<br>
<br>
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winecfg`
- <p>With this command you will open winecfg, I recommend changing the "windows version" to: Windows 10, then you click on the libraries tab, type dwrite and then click on add and then click on apply.</p>

After that install the latest version of [Proton GE](https://github.com/GloriousEggroll/proton-ge-custom), and put it to run on steam as the main Proton.

#### How to install wine-mono

Download wine-mono-XX-X-X-x86.msi for the version of Proton you are using from [WineHQ](https://dl.winehq.org/wine/wine-mono/), e.g: For Proton 10.1 download the Wine 10.1 MSI installer.

Once downloaded, run the next command:
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx wine uninstall`

Once a window pops up, click on `install` and then select the wine-mono-XX-X-X-x86.msi file that was downloaded.
> [!NOTE]
> It is common for the game or content manager to produce some errors when installing dependencies or when trying to open them, but know that this is part of it, and does not prevent the game from running!
<br><br>
## Native

> [!WARNING]
> The script was written in Ruby and depends 100% on it, the code is open to anyone who wants to see and explore the possibilities, the script will basically automate the installation of dependencies and the like, it has user data input, being possible to insert the prefix when the script asks for it, it has been tested several times (LMDE)

`$ git clone https://github.com/vitorserveja/Sakaki-AC-Linux-Guide/`<br>
`$ cd Sakaki-AC-Linux-Guide/`<br>
`$ ruby install.rb`<br>

<p>
I recommend that you delete the current prefix if you are using the script, so that a clean installation can be done.
</p>

After that install the latest version of [Proton GE](https://github.com/GloriousEggroll/proton-ge-custom), and put it to run on steam as the main Proton.

> [!IMPORTANT]
> It is common for the game or content manager to produce some errors when installing dependencies or when trying to open them, but know that this is part of it, and does not prevent the game from running!
<br><br>
## Modding

Open the Assetto Corsa folder and rename *AssettoCorsa.exe* to *AssettoCorsaBackup.exe*<br>
then download the [Content Manager](https://assettocorsa.club/content-manager.html) and extract it to the main Assetto Corsa folder, and rename *Content Manager.exe* to *AssettoCorsa.exe* and open the game via Steam.<br>
then the Content Manager will open, you can configure and modify as you wish, I recommend using version 0.2.0 of the Custom Shaders Patch, avoid very new or very old versions!
<br><br>
## Online

Online mode also works smoothly, both public kunos servers and LAN servers, but it requires some adjustments. On Arch Linux, it didn't need so many adjustments, but if your system has an active Firewall, you will need to approve the Assetto Corsa ports on your firewall, e.g.: `% sudo ufw allow 9600:9700/udp && sudo ufw allow 9600:9700/tcp`, or approve them on your firewall.<br>

and to enter private/LAN servers it is more complicated, you will need to click on the Online > Kunos tabs, and add any server to Favorites, after adding, some new tabs will appear within Online: Favorites, Recent and LAN, you will need to open the server through Content Manager (or if your friend opens it you will need his IP, usually it is in Hamachi or Radmin), but if you open the server, the LAN tab of Content Manager for Linux is broken and does not work, if your friend is on Windows he will see your server open in LAN, but you will not see it, to enter your own server you can type in the terminal: ip addr show, and get your IP that will be saved in the network interface you are connected to, e.g: `*enp4s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
link/ether ########## brd ff:ff:ff:ff:ff:ff 
altname ############ 
inet 192.###.#.#/24* ## This last part where it says inet and some numbers is your IP`<br>
and get your IP and the server is open, click on the favorites tab in Content Manager, and in this tab at the bottom next to the refresh button, you will see the "+" symbol, click on it to add the server, you will need to add it in a specific way to be recognized, for example: *127.0.0.1:9600*<br>
"*127.0.0.1* is an example of an IP, the symbol ":" is used to add the port, and the port is *9600* fixed, you need to add *9600*.", after that click on OK, and the server will appear in the Favorites tab for you to connect, if it does not appear, restart Content Manager and go back to the favorites tab, it will appear.
<br><br>

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

### And

OS: LMDE 6 (faye) x86_64<br>
Host: H81<br>
Kernel: 6.1.0-37-amd64<br>
Uptime: 2 hours, 54 mins<br>
Packages: 2413 (dpkg)<br>
Shell: bash 5.2.15<br>
Resolution: 1440x900<br>
DE: Cinnamon 6.4.8<br>
WM: Mutter (Muffin)<br>
WM Theme: Mint-Y-Dark-Sand (Mint-Y)<br>
Theme: Mint-Y-Dark-Sand [GTK2/3]<br>
Icons: Mint-Y-Sand [GTK2/3]<br>
Terminal: gnome-terminal<br>
CPU: Intel i5-4590 (4) @ 3.700GHz<br>
GPU: AMD ATI Radeon 540/540X/550/550X / RX 540X/550/550X<br>
Memory: 6447MiB / 15948MiB<br>

### For Linux Mint 22.1 

OS: Linux Mint 22.1 x86_64
Kernel: 6.8.0-51-generic
Shell: bash 5.2.| 
DE: Cinnamon 6.4.6 
WM: Mutter (Muffin)
CPU: AMD Ryzen 5 3400G
GPU: NVIDIA GeForce RTX 2060
Memory: 15928MiB

## LONG LIVE LINUX GAMING!
