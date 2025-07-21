# Assetto Corsa Linux Guide - In development 0.7! [Stable!] 🌠 
Sakaki guide to running Assetto Corsa with Mods (CSP) + Online + Content Manager on Linux<br>

> [!WARNING]
> <p>Some recent ProtonGE versions are showing instabilities with the game, I recommend using GE10-8.</p>  
> <p>recently the script installation was removed
> because I'm a bit paranoid about scripts and I wouldn't want other people to feel that way.  
> please be patient, we are working hard to create a bridge from Assetto Corsa to Linux.</p>
> <p>The guide has been tested on several popular distros and has had the same results on most of them, I would say it is stable enough!</p>

- [Installation](#installation)
  - [Native](#native)
  - [Flatpak](#flatpak)
- [Modding](#modding)
- [Online](#online)
- [Configuration Used](doc)
- [Collaborators](doc/thanks-to-collaborators.md)

> [!IMPORTANT]
> <p>If you have already tried to run the game on Linux, I strongly recommend that you delete the game prefix (usually in ~/.steam/steam/steamapps/compatdata/244210/)

## Installation
 ### Native

start the game using Proton 5.0-10 and let it run until it crashes silently, as proton switching is necessary!

In this guide we will use the following directory as an example, you must adapt it if yours is different or if your game is on another disk!

`~/.steam/steam/steamapps/compatdata/244210/pfx`

It is recommended to use this command to clean any corrupted winetricks packages in the cache:

	rm -rf ~/.cache/winetricks

the winetricks annihilate below will clean up the prefix and delete any loose dependencies:

	WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks annihilate

then we will install the game dependencies below:

	WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks dotnet48

	WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks vcrun2015
	
	WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks d3dcompiler_47
	
	WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks dxvk
	
now enter winecfg, and add it as Windows 10, and in libraries add dwrite.dll to be able to use the CSP in Content Manager

	WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winecfg

<p>Now you can open the game again with any proton you want! (I recommend protonGE10-8 or Hotflix/Exp</p>
<p>It is common for the game or Content Manager to produce some errors when installing dependencies or when trying to open them, but know that this is part of it, and does not prevent the game from running!</p>

 ### Flatpak
 
start the game using Proton 5.0-10 and let it run until it crashes silently, as proton switching is necessary!

In this guide we will use the following directory as an example, you must adapt it if yours is different or if your game is on another disk!

`~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/pfx`

It is recommended to use this command to clean any corrupted winetricks packages in the cache:

	rm -rf ~/.cache/winetricks

the winetricks annihilate below will clean up the prefix and delete any loose dependencies:

	WINEPREFIX=~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/pfx winetricks annihilate

then we will install the game dependencies below:

	WINEPREFIX=~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/pfx winetricks dotnet48

	WINEPREFIX=~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/pfx winetricks vcrun2015
	
	WINEPREFIX=~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/pfx winetricks d3dcompiler_47
	
	WINEPREFIX=~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/pfx winetricks dxvk
now enter winecfg, and add it as Windows 10, and in libraries add dwrite.dll to be able to use the CSP in Content Manager
	
	WINEPREFIX=~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/pfx winecfg
	
If you use Proton GE, you need to add support via flatpak using:

	flatpak install com.valvesoftware.Steam.CompatibilityTool.Proton-GE
<p>Now you can open the game again with any proton you want! (I recommend protonGE10-8 or Hotflix/Exp</p>
<p>It is common for the game or Content Manager to produce some errors when installing dependencies or when trying to open them, but know that this is part of it, and does not prevent the game from running!</p>
 
## Modding

<p>Open the Assetto Corsa folder and rename *AssettoCorsa.exe* to *AssettoCorsa_original.exe*, Then download the Content Manager: https://assettocorsa.club/content-manager.html, and extract it to the main Assetto Corsa folder. Rename *Content Manager.exe* to *AssettoCorsa.exe*.  
	
Download the CSP fonts: https://acstuff.club/u/blob/ac-fonts.zip, and extract them to assettocorsa/content/fonts/. Then, launch the game via Steam.</p>
<p>The Content Manager will then open. You can configure and modify it as you wish. I recommend using version 0.2.0 of the Custom Shaders Patch. Avoid very new or very old versions!</p>

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
