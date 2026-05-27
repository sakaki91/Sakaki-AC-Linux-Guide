#### Assetto Corsa Linux Guide!

Sakaki guide to running Assetto Corsa with Mods (CSP) + Online/LAN + Content Manager on *Linux*.  
*Try also __[Sihawido Guide](https://github.com/sihawido/assettocorsa-linux-setup/), and [ProtonDB](https://www.protondb.com/app/244210)__.*  

#### Getting Started
Remember, Assetto Corsa on Linux is an anomaly, and stability is achieved through unorthodox steps. If it doesn't work, it's NOT my fault, I'm just TRYING to help in any way I can.  

If you encounter any __[problem](https://github.com/sakaki91/Sakaki-AC-Linux-Guide/issues)__, please report it in __AS MUCH DETAIL AS POSSIBLE__.  

__Initially, we will need these basic dependencies:__ `wine, winetricks, steam (or flatpak steam)`

1. [Getting Started](#getting-started)  
	1.1. [Preparing Prefix](#preparing-prefix)  
	1.2. [Game Dependencies](#game-dependencies)  
	1.3. [Modding](#modding)  
    1.4. [Online](#online)  

#### Preparing Prefix

In this guide, we will use the following directory as an example:  

> [EXAMPLES]:  
> Steam Native: `~/.steam/steam/steamapps/compatdata/244210/pfx`.  
> Steam Flatpak: `~/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/pfx`.  
> Custom: `[path]/SteamLibrary/steam/steamapps/compatdata/244210/pfx`.  

After discovering the path to your prefix, it's necessary to delete the prefix so that we can perform a clean installation of the dependencies using the commands below:  
	
	$ sudo rm -rf ~/.steam/steam/steamapps/compatdata/244210

And if you've already tried installing the game and its dependencies using winetricks, I recommend clearing the winetricks cache just to be safe:  
	
	$ rm -rf ~/.cache/winetricks

Now we prove that the Steam is closed, as we will install the Proton-GE and prepare the prefix manually.

	$ wget -c https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton9-20/GE-Proton9-20.tar.gz

Now extract it to the Steam (Runners folder):

	$ tar -xvf GE-Proton9-20.tar.gz --directory ~/.steam/steam/compatibilitytools.d/

Now, select the GE-Proton9-20 as the runner in the game and click Play on Steam.  
After that, we will include the game prefix path in the *WINEPREFIX* variable with:  

	$ export WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx

With that ready, you can proceed to installation.  

#### Game Dependencies

It is EXTREMELY important that you go through ALL the steps.  

First, I ran winetricks to clean up any "loose ends" in the prefix:

	$ winetricks annihilate

Then we will install the game dependencies below:  

	$ winetricks dotnet48
	$ winetricks vcrun2015
	$ winetricks d3dcompiler_47

Next, we'll use the winecfg below to set the version to Windows 10:  

	$ winecfg /v win10

Next, we'll insert the dwrite.dll file so that CSP can be used in the Content Manager, but we'll do it in the Steam arguments:

	WINEDLLOVERRIDES="dwrite=n,b" %command%

#### Modding

Open the Assetto Corsa folder and rename *AssettoCorsa.exe* to *AssettoCorsa_original.exe*, Then download the __[Content Manager](https://acstuff.ru/app/latest.zip)__, and extract it to the main Assetto Corsa folder. Rename *Content Manager.exe* to *AssettoCorsa.exe*.  
Download the __[CSP fonts](https://acstuff.club/u/blob/ac-fonts.zip)__, and extract them to assettocorsa/content/fonts/.  
Then, launch the game via Steam, the Content Manager will then open.  
> [!CAUTION]
> DO NOT CLICK TO CREATE A DESKTOP SHORTCUT IN THE INITIAL CONTENT MANAGER CONFIGURATION, AS IT WILL CRASH AND YOU WILL NEED TO DELETE EVERYTHING RELATED TO IT AND START OVER. Just configure it as you wish, but DO NOT click on "create desktop shortcut".  

Now you can configure and modify it as you wish.  
I recommend using version 0.2.0 of the Custom Shaders Patch, Avoid very new or very old versions! (Both work but with some instability, but I believe that happens even in Windows.)  

#### Online

Online mode also works perfectly, both on public Kunos servers and on LAN servers, but requires some adjustments, if your system has a firewall active, you'll need to allow Assetto Corsa ports in your firewall, for example:  

	$ sudo ufw allow 9600:9700/udp && sudo ufw allow 9600:9700/tcp

or approve them in your firewall if you use a different one.  

With this, you will be able to access public servers.  

and to enter private/LAN servers it is more complicated, you will need to click on the Online > Kunos tabs, and add any server to Favorites, after adding, some new tabs will appear within Online: Favorites, Recent and LAN, you will need to open the server through Content Manager (or if your friend opens it you will need his IP, usually it is in Hamachi or Radmin), but if you open the server, the LAN tab of Content Manager for Linux is broken and does not work.  
if your friend is on Windows he will see your server open in LAN, but you will not see it.  

__To enter, you can do the following__: click on the Favorites tab in the Content Manager. In this tab, at the bottom next to the refresh button, you will see the "+" symbol. Click on it to add the server, you can use your local IP address as shown below, and the server will appear for you:  

	127.0.0.1:9600

now you can play the way you want.
