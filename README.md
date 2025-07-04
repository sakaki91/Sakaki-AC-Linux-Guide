# Assetto Corsa Linux Guide - In development 0.5! [unStable!] 🌠 
Sakaki guide to running Assetto Corsa with Mods (CSP) + CM on Linux<br>

> [!WARNING]
> <p>Several distributions are being tested, evaluated and adapted, please be patient, we are working hard to create a bridge from Assetto Corsa to Linux.</p>
> <p>The guide is only stable for Arch Linux and derivatives and Linux Mint (Tested on 20/06/2025), I am currently exploring LMDE and it is working but it is still
> experimental, I will look for stability and then I will try to adapt it to Fedora with wine-staging.</p>

- [Installation](#installation)
  - [Manual - Recommended! 🌠](doc/native.md)
  - [Flatpak](doc/flatpak.md)
  - [Script/Native](#native-script)
  - [Script/Flatpak](flatpak-script)
- [Modding](#modding)
- [Online](#online)
- [Configuration Used](doc)
- [Collaborators](doc/thanks-to-collaborators.md)

> [!IMPORTANT]
> <p>If you have already tried to run the game on Linux, I strongly recommend that you delete the game prefix (usually in ~/.steam/steam/steamapps/> compatdata/244210/)
> You also must delete the winetricks cache with `$ rm -rf ~/.cache/winetricks` (if you have never used it, you do not need to delete it), and from there you can > follow the tutorial below.</p>
> <p>It is common for the game or Content Manager to produce some errors when installing dependencies or when trying to open them, but know that this is part of it, and does not prevent the game from running!</p>

## Installation
> ### Native Script
> `$ git clone https://github.com/vitorserveja/Sakaki-AC-Linux-Guide/`<br>
> `$ cd Sakaki-AC-Linux-Guide/`<br>
> `$ sh generic-run.sh`<br>
> and to install the Content Manager:  
> `$ sh modding.sh`

### Flatpak Script
> `$ git clone https://github.com/vitorserveja/Sakaki-AC-Linux-Guide/`<br>
> `$ cd Sakaki-AC-Linux-Guide/`<br>
> `$ sh flatpak-run.sh`<br>
> and to install the Content Manager:  
> `$ sh modding.sh`
> 
>you also need to install proton ge support via flatpak using: `flatpak install com.valvesoftware.Steam.CompatibilityTool.Proton-GE`
>After that install the latest version of [Proton GE](https://github.com/GloriousEggroll/proton-ge-custom), and put it to run on steam as the main Proton.  

## Modding

<p>

  Open the Assetto Corsa folder and rename *AssettoCorsa.exe* to *AssettoCorsaBackup.exe*
then download the [Content Manager](https://assettocorsa.club/content-manager.html) and extract it to the main Assetto Corsa folder, and rename *Content Manager.exe* to *AssettoCorsa.exe* and open the game via Steam.</p>
<p>then the Content Manager will open, you can configure and modify as you wish, I recommend using version 0.2.0 of the Custom Shaders Patch, avoid very new or very old versions!</p>
or run the modding.sh script and it automates everything, it just asks for the game directory
<br><br>

## Online

<p>Online mode also works smoothly, both public kunos servers and LAN servers, but it requires some adjustments. On Arch Linux, it didn't need so many adjustments, but if your system has an active Firewall, you will need to approve the Assetto Corsa ports on your firewall, e.g.: `% sudo ufw allow 9600:9700/udp && sudo ufw allow 9600:9700/tcp`, or approve them on your firewall.</p>

<p>and to enter private/LAN servers it is more complicated, you will need to click on the Online > Kunos tabs, and add any server to Favorites, after adding, some new tabs will appear within Online: Favorites, Recent and LAN, you will need to open the server through Content Manager (or if your friend opens it you will need his IP, usually it is in Hamachi or Radmin), but if you open the server, the LAN tab of Content Manager for Linux is broken and does not work.</p>
</p>if your friend is on Windows he will see your server open in LAN, but you will not see it, to enter your own server you can type in the terminal: 
<p>
  
`$ ip addr show`, and get your IP that will be saved in the network interface you are connected to, e.g: `*enp4s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
link/ether ########## brd ff:ff:ff:ff:ff:ff 
altname ############ 
inet 192.###.#.#/24* ## This last part where it says inet and some numbers is your IP`
and get your IP and the server is open, click on the favorites tab in Content Manager, and in this tab at the bottom next to the refresh button, you will see the "+" symbol, click on it to add the server, you will need to add it in a specific way to be recognized, for example: *127.0.0.1:9600*</p>
<p>"*127.0.0.1* is an example of an IP, the symbol ":" is used to add the port, and the port is *9600* fixed, you need to add *9600*.", after that click on OK, and the server will appear in the Favorites tab for you to connect, if it does not appear, restart Content Manager and go back to the favorites tab, it will appear.
</p>

#### LONG LIVE LINUX GAMING!
