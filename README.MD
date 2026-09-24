# Assetto Corsa Linux Guide

Sakaki guide to running Assetto Corsa with Mods (CSP) + Online/LAN + Content Manager on Linux.

__Try also:__ [Sihawido Method](https://github.com/sihawido/assettocorsa-linux-setup/) and [ProtonDB](https://www.protondb.com/app/244210).


## Getting Started:

<p>

Remember, unexpected things and edge cases can happen, it's common, but this is a public attempt to map it.
</p>

> [!WARNING]  
Warning: This guide is based on the native Steam version (non-flatpak), if you are using a different version, some commands may need to be adapted.

__For this guide we will use the following dependencies:__ `wget protontricks steam`

<p>

We will also use [GE-Proton9-20](https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton9-20/GE-Proton9-20.tar.gz) to run the game (this can be changed after configuration):
</p>

```
$ mkdir -p $HOME/.local/share/Steam/compatibilitytools.d/
$ wget -c https://github.com/GloriousEggroll/proton-ge-custom/releases/download/GE-Proton9-20/GE-Proton9-20.tar.gz
$ tar -xvf GE-Proton9-20.tar.gz --directory $HOME/.local/share/Steam/compatibilitytools.d/
```

<p>

After that, select it as the main runner for Assetto Corsa on Steam by going to:
</p>
Steam > Library > Collections > Assetto Corsa > Properties > Compatibility > GE-Proton9-20

<p>

Click __Play__ the game won't open, but it will create the necessary prefix so we can perform maintenance.
</p>

<p>

After that, we will install the dependencies.
</p>

## Prefix maintenance:

Install the dependencies in the prefix with:

```
$ protontricks 244210 dotnet48
$ protontricks 244210 vcrun2015
$ protontricks 244210 d3dcompiler_47
```

After that, you'll be able to play normally _(base game)_!

## Modding:

Open the Assetto Corsa folder and rename *AssettoCorsa.exe* to *AssettoCorsa_original.exe*.

<p>

Then download the [Content Manager](https://acstuff.ru/app/latest.zip)
and extract it to the main Assetto Corsa folder. Rename *Content Manager.exe* to *AssettoCorsa.exe*.
</p>

<p>

Download the [fonts](https://acstuff.club/u/blob/ac-fonts.zip)
and extract them to assettocorsa/content/fonts/.
</p>

<p>

Next, we'll insert the dwrite.dll file so that CSP can be used in the Content Manager, but we'll do it in the Steam arguments:
</p>

```
WINEDLLOVERRIDES="dwrite=n,b" %command%
```

<p>

Then, launch the game via Steam, the Content Manager will then open.
</p>

> [!WARNING]  
DO NOT CLICK TO CREATE A DESKTOP SHORTCUT IN THE INITIAL CONTENT MANAGER CONFIGURATION, AS IT WILL CRASH AND YOU WILL NEED TO DELETE EVERYTHING RELATED TO IT AND START OVER.  
Just configure it as you wish, but DO NOT click on "create desktop shortcut".

Now you can configure and modify it as you wish.


## Online:

<p>

Online mode also works perfectly, both on public Kunos servers and on LAN servers, but requires some adjustments, if your system has a firewall active, you'll need to allow Assetto Corsa ports in your firewall, for example:
</p>

	$ sudo ufw allow 9600:9700/udp && sudo ufw allow 9600:9700/tcp

or approve them in your firewall if you use a different one.

With this, you will be able to access public servers.

<p>

and to enter private/LAN servers it is more complicated, you will need to click on the Online > Kunos tabs, and add any server to Favorites, after adding, some new tabs will appear within Online: Favorites, Recent and LAN, you will need to open the server through Content Manager (or if your friend opens it you will need his IP, usually it is in Hamachi or Radmin), but if you open the server, the LAN tab of Content Manager for Linux is broken and does not work.
</p>

if your friend is on Windows he will see your server open in LAN, but you will not see it.

To enter, you can do the following: click on the Favorites tab in the Content Manager.

In this tab, at the bottom next to the refresh button, you will see the "+" symbol.

Click on it to add the server, you can use your local IP address as shown below, and the server will appear for you:

	127.0.0.1:9600

now you can play the way you want.
