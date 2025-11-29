 # Assetto Corsa Linux Guide - 🌠

Sakaki guide to running Assetto Corsa with Mods (CSP) + Online + Content Manager on Linux.<br>
*Try also __[Sihawido Guide](https://github.com/sihawido/assettocorsa-linux-setup/), and [ProtonDB](https://www.protondb.com/app/244210)__.*<br>

> [!WARNING]
> Some recent GE-Proton versions are showing instabilities with the game, In this guide, I use and recommend version [GE-Proton9-20](https://github.com/GloriousEggroll/proton-ge-custom/releases/tag/GE-Proton9-20).  
thanks to all the reports with this specific version on ProtonDB!<br>  
> The guide has been tested on several popular distros and has had the same results on most of them, I would say it is stable enough!  
If you encounter any __[problems](https://github.com/sakaki91/Sakaki-AC-Linux-Guide/issues)__, please report them.<br>  
> Yes, I know it's not the cleanest way to do it, but I'm trying VERY hard to optimize this whole mess.  
> Remember, Assetto Corsa on Linux is an anomaly, and stability is achieved through unorthodox steps. If it doesn't work, it's NOT my fault; I'm just TRYING to help in any way I can :)  

- [Getting Started](#)
	- [Dependencies](#dependencies)
	- [Preparing Prefix](#preparing-prefix)
	- [Installation](#new-guide)
		- [New-Guide (Recommended)](#new-guide)
			- [[NG] - Script Installation (Coming Soon!)](#script-installation)
		- [Legacy-Guide](src/legacy_guide/README.md)
	- [Modding](#modding)
	- [Online](#online)
	- [Extras](#extras)
		- [Configuration Used](src/)
		- [Collaborators](src/documentation/thanks-to-collaborators.md)

## Dependencies

To begin, you will need the following tools:  
`steam, wine, winetricks`, (And if you use Steam via Flatpak, you will obviously also need Flatpak.

Example of installation on popular distributions:  

__Arch Linux__:

	$ sudo pacman -Syu && sudo pacman -S wine winetricks steam

__Ubuntu/Debian__:

	$ sudo apt update && sudo apt install steam wine winetricks

__Fedora/Nobara__

	$ sudo dnf update && sudo dnf install wine winetricks steam

If you use an independent distribution like Gentoo or Void Linux, you will need to adapt it to your needs.

## Preparing Prefix

In this guide, we will use the following directories as examples:

Native Steam: `~/.steam/steam/steamapps/compatdata/244210/`  
Flatpak Steam: `~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/`  

If you have a custom directory on a different disk/partition, the logic remains the same, it would look something like this: `[path]/SteamLibrary/steam/steamapps/compatdata/244210`

After discovering the path to your prefix, it's necessary to delete the prefix so that we can perform a clean installation of the dependencies using the commands below:
	
	$ sudo rm -rf ~/.steam/steam/steamapps/compatdata/244210

Remember, if you are using a custom directory or a different disk/partition, you will need to adapt the command above to your Steam directory, and I recommend that you also write down your directory in a notepad, as we will need the path to the directory later on so that we can perform maintenance on the prefix.

And if you've already tried installing the game and its dependencies using winetricks, I recommend clearing the winetricks cache just to be safe:
	
	$ rm -rf ~/.cache/winetricks

Now, after deleting your game prefix, we will recreate it manually, yes... that's right.  

Using the following commands:  
	
	$ mkdir -p ~/.steam/steam/steamapps/compatdata/244210/pfx

After creating the folders, we will store their path in the *__WINEPREFIX__* variable.  

	$ export WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx

And now:  

	$ wineboot

With this, we created the basic structure of the "*Wine* directory and registry system".  

## New Guide

After following the instructions above and preparing the prefix, we will install the dependencies and work around some DLL overlapping issues that Proton itself causes:

	$ winetricks dotnet48

	$ winetricks vcrun2019

	$ winetricks d3dcompiler_47

And now we will select the prefix version for Windows 10:

	$ winecfg /v win10

And lastly, we will inject the dwrite.dll so we can use CSP:

	$ wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v dwrite /d native,builtin /f

and now we will run:

	$ steam steam://rungameid/244210

Or if you use Steam Flatpak:

	$ flatpak run --command=steam com.valvesoftware.Steam steam://rungameid/244210

the game will crash silently without returning an error.  
Or if it mysteriously opens, close it and type one last command:

	$ winetricks --force vcrun2015

I've tested it several times, the installer usually doesn't open, but it returns a message in the terminal, and mysteriously the CSP starts working. I'm still investigating what exactly this could be.  

and if you use Proton GE in Steam Flatpak, you need to add support via flatpak using:

	$ flatpak install com.valvesoftware.Steam.CompatibilityTool.Proton-GE

now you can play the way you want

for subtle performance and latency improvements I recommend using __[kernel-zen](https://github.com/zen-kernel/zen-kernel)__ and the ntsync module __(OPTIONAL)__ :

	$ sudo modprobe ntsync

<p>It is common for the game or Content Manager to produce some errors when installing dependencies or when trying to open them, but know that this is part of it, and does not prevent the game from running, they are usually errors like:

`[rundll32.exe]: This application could not be started.`
</p>

## Modding
Open the Assetto Corsa folder and rename *AssettoCorsa.exe* to *AssettoCorsa_original.exe*, Then download the __[Content Manager](https://acstuff.ru/app/latest.zip)__, and extract it to the main Assetto Corsa folder. Rename *Content Manager.exe* to *AssettoCorsa.exe*.
Download the __[CSP fonts](https://acstuff.club/u/blob/ac-fonts.zip)__, and extract them to assettocorsa/content/fonts/. Then, launch the game via Steam, the Content Manager will then open.
You can configure and modify it as you wish. I recommend using version 0.2.0 of the Custom Shaders Patch. Avoid very new or very old versions!

## Online
<p>Online mode also works perfectly, both on public Kunos servers and on LAN servers, but requires some adjustments. On Arch Linux, not as many adjustments were required, but if your system has a firewall active, you'll need to allow Assetto Corsa ports in your firewall, for example:

	$ sudo ufw allow 9600:9700/udp && sudo ufw allow 9600:9700/tcp

or approve them in your firewall if you use a different one.</p>

<p>and to enter private/LAN servers it is more complicated, you will need to click on the Online > Kunos tabs, and add any server to Favorites, after adding, some new tabs will appear within Online: Favorites, Recent and LAN, you will need to open the server through Content Manager (or if your friend opens it you will need his IP, usually it is in Hamachi or Radmin), but if you open the server, the LAN tab of Content Manager for Linux is broken and does not work.</p>
</p>if your friend is on Windows he will see your server open in LAN, but you will not see it, to enter your own server you can type in the terminal:
<p>

	$ ip a | grep inet

and get your IP. Once the server is open, click on the Favorites tab in the Content Manager. In this tab, at the bottom next to the refresh button, you will see the "+" symbol. Click on it to add the server. You will need to add it in a specific way for it to be recognized, for example:</p>

	127.0.0.1:9600

<p>"*127.0.0.1* is an example of an IP, the ":" symbol is used to add the port, and the port is *9600* fixed, you need to add *9600*." After that, click OK, and the server will appear in the Favorites tab for you to connect to. If it does not appear, restart the Content Manager and return to the Favorites tab. It will appear.
</p>

## Extras
the game was tested several times manually isolating the dependencies and trying to "detach" itself from the proton switching, but it was still necessary to open the game through steam and wait for it to crash on its own, I tried to create the prefix manually, and everything seemed to be going relatively well but in the end when running the game, proton overwrites the manually installed dependencies (vcrun2015 mainly), it was tested with vcrun2019 as well, but it showed SEVERAL instabilities and crashes, even though it worked unstable, enjoy!

#### LONG LIVE LINUX GAMING! 
