 # Assetto Corsa Linux Guide - 🌠

Sakaki guide to running Assetto Corsa with Mods (CSP) + Online + Content Manager on Linux.<br>
*Try also __[Sihawido Guide](https://github.com/sihawido/assettocorsa-linux-setup/).__*<br>

> [!WARNING]
> Some recent GE-Proton versions are showing instabilities with the game, I recommend using Proton Experimental or Proton 10<br>
> The guide has been tested on several popular distros and has had the same results on most of them, I would say it is stable enough!<br>
> please be patient, we are working hard to create a bridge from Assetto Corsa to Linux.
If you encounter any __[problems](https://github.com/sakaki91/Sakaki-AC-Linux-Guide/issues)__, please report them.

- [Getting Started](#)
	- [Dependencies](#dependencies)
	- [Preparing Prefix](preparing-prefix)
	- [Install](#install)
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

## Installation
First, go to your library and do:  
`[Library > Collections > Assetto Corsa > Properties > Compatibility > Proton 5.0-10]`

Proton switching is still necessary (I'm looking for solutions to not depend on switching), change to Proton 5.0-10 in game properties, and type below:

	$ steam steam://rungameid/244210

Or if you use Flatpak it would be:  

	$ flatpak run --command=steam com.valvesoftware.Steam steam://rungameid/244210

the game will crash silently without returning an error  

Now let's define the prefix (adapt it if yours is in a different location!) with:

	$ export WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx

This command is used to export and save the path in the __*WINEPREFIX*__ variable, so you don't need to repeat it several times.  

after this happens use the following command to clean up any loose dependencies on the prefix:  

	$ winetricks annihilate

then we will install the game dependencies below:

	$ winetricks dotnet48

	$ winetricks vcrun2015

	$ winetricks d3dcompiler_47

	$ winetricks dxvk

Next, we'll use the winecfg below to set the version to Windows 10, without needing to open the winecfg window:

	$ winecfg /v win10

Next, we will inject the dwrite.dll file so that it's possible to use CSP in the Content Manager.

	$ wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v dwrite /d native,builtin /f

If you use Proton GE in Steam Flatpak, you need to add support via flatpak using:

	$ flatpak install com.valvesoftware.Steam.CompatibilityTool.Proton-GE

now you can play the way you want

for subtle performance and latency improvements I recommend using __[kernel-zen](https://github.com/zen-kernel/zen-kernel)__ and the ntsync module __(OPTIONAL)__ :

	sudo modprobe ntsync

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
