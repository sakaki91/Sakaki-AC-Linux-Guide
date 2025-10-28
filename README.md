# Assetto Corsa Linux Guide - 🌠 
Sakaki guide to running Assetto Corsa with Mods (CSP) + Online + Content Manager on Linux.<br>
*Try also [Sihawido Guide](https://github.com/sihawido/assettocorsa-linux-setup/).*<br>

> [!WARNING]  
> Some recent GE-Proton versions are showing instabilities with the game, I recommend using Proton Experimental or Proton 10<br>  
> The guide has been tested on several popular distros and has had the same results on most of them, I would say it is stable enough!<br>
> please be patient, we are working hard to create a bridge from Assetto Corsa to Linux.  
If you encounter any [__problems__](https://github.com/sakaki91/Sakaki-AC-Linux-Guide/issues), please report them.

__Dependencies: `wine, winetricks, steam.`__

- [Installation](#installation)
- [Modding](#modding)
- [Online](#online)
- [Extras](#extras)
- [Configuration Used](doc)
- [Collaborators](doc/thanks-to-collaborators.md)

> [!IMPORTANT]
> <p>Firstly, it is necessary and recommended to delete the current prefix (244210) (usually in ~/.steam/steam/steamapps/compatdata/244210/ #native or ~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/ #flatpak)

__EXAMPLE:__

	rm -rf ~/.steam/steam/steamapps/compatdata/244210/ #native-steam
	rm -rf ~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/ #flatpak-steam
	
## Installation

It is recommended to use this command to clean any corrupted winetricks packages in the cache:

	rm -rf ~/.cache/winetricks

In this guide we will use the following directory as an example, you must adapt it if yours is different or if your game is on another disk!

For native:  
`~/.steam/steam/steamapps/compatdata/244210/pfx`

For flatpak:
`~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/pfx`

we will define the prefix (adapt if yours is in another location!) with:

	export WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx

This command is used to export and save the path in the __*WINEPREFIX*__ variable, so you don't need to repeat it several times.

Proton switching is still necessary (I'm looking for solutions to not depend on switching), change to Proton 5.0-10 in game properties, and type below:  

__Native:__

	steam steam://rungameid/244210 
__Flatpak:__

	flatpak run --command=steam com.valvesoftware.Steam steam://rungameid/244210 

the game will crash silently without returning an error, after this happens use the following command to clean up any loose dependencies on the prefix:

	winetricks annihilate

then we will install the game dependencies below:

	winetricks dotnet48

	winetricks vcrun2015
	
	winetricks d3dcompiler_47
	
	winetricks dxvk
	
now enter winecfg, and add it as Windows 10, and in libraries add dwrite.dll to be able to use the CSP in Content Manager

	winecfg

If you use Proton GE in Steam Flatpak, you need to add support via flatpak using:

	flatpak install com.valvesoftware.Steam.CompatibilityTool.Proton-GE

for subtle performance and latency improvements I recommend using kernel-zen and the ntsync module __(OPTIONAL)__ : 

	sudo modprobe ntsync

now you can play the way you want

<p>It is common for the game or Content Manager to produce some errors when installing dependencies or when trying to open them, but know that this is part of it, and does not prevent the game from running, they are usually errors like:  

`[rundll32.exe]: This application could not be started.`

</p>
 
## Modding

Open the Assetto Corsa folder and rename *AssettoCorsa.exe* to *AssettoCorsa_original.exe*, Then download the [Content Manager](https://assettocorsa.club/content-manager.html), and extract it to the main Assetto Corsa folder. Rename *Content Manager.exe* to *AssettoCorsa.exe*.  
	
Download the [CSP fonts](https://acstuff.club/u/blob/ac-fonts.zip), and extract them to assettocorsa/content/fonts/. Then, launch the game via Steam, the Content Manager will then open.  
You can configure and modify it as you wish. I recommend using version 0.2.0 of the Custom Shaders Patch. Avoid very new or very old versions!

## Online

<p>Online mode also works perfectly, both on public Kunos servers and on LAN servers, but requires some adjustments. On Arch Linux, not as many adjustments were required, but if your system has a firewall active, you'll need to allow Assetto Corsa ports in your firewall, for example:

	sudo ufw allow 9600:9700/udp && sudo ufw allow 9600:9700/tcp
or approve them in your firewall if you use a different one.</p>

<p>and to enter private/LAN servers it is more complicated, you will need to click on the Online > Kunos tabs, and add any server to Favorites, after adding, some new tabs will appear within Online: Favorites, Recent and LAN, you will need to open the server through Content Manager (or if your friend opens it you will need his IP, usually it is in Hamachi or Radmin), but if you open the server, the LAN tab of Content Manager for Linux is broken and does not work.</p>
</p>if your friend is on Windows he will see your server open in LAN, but you will not see it, to enter your own server you can type in the terminal: 
<p>
  
	ip a | grep inet
and get your IP. Once the server is open, click on the Favorites tab in the Content Manager. In this tab, at the bottom next to the refresh button, you will see the "+" symbol. Click on it to add the server. You will need to add it in a specific way for it to be recognized, for example:</p> 	

	 127.0.0.1:9600
	
<p>"*127.0.0.1* is an example of an IP, the ":" symbol is used to add the port, and the port is *9600* fixed, you need to add *9600*." After that, click OK, and the server will appear in the Favorites tab for you to connect to. If it does not appear, restart the Content Manager and return to the Favorites tab. It will appear.
</p>

## Extras

the game was tested several times manually isolating the dependencies and trying to "detach" itself from the proton switching, but it was still necessary to open the game through steam and wait for it to crash on its own, I tried to create the prefix manually, and everything seemed to be going relatively well but in the end when running the game, proton overwrites the manually installed dependencies (vcrun2015 mainly), it was tested with vcrun2019 as well, but it showed SEVERAL instabilities and crashes, even though it worked unstable, enjoy!

#### LONG LIVE LINUX GAMING!
