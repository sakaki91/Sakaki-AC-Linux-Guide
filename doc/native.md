## Manual Installation:

<p>The game was tested and run on Arch Linux x86_64 and Linux Mint 22.1, the game was tested several times looking for defects and debugging the crashes, with this guide it is 100% certain that you will be able to run the game, in a similar way, I believe the guide will also work for Ubuntu/Debian-like too, soon I will look for the appropriate solutions for these other popular distros!</p>

<p>Now you need to install the game, and in the game properties on Steam and select the "Compatibility" tab and then "Force use of the Steam Play Compatibility Tool", and below select the **Proton 5.0-10** version, after that click Play, probably the game will not open, it will have a silent Crash, as soon as the Play button appears again, you minimize Steam and open the terminal</p>

<p>When you press play using Proton 5.0 even if the game doesn't open, or crashes, it created a VERY important prefix in the compatdata folder in the Steam folder, usually located at ~/.steam/steam/steamapps/compatdata, inside the compatdata folder the 244210 folder was created and inside it will be the pfx/ folder
you will need to use the WINEPREFIX command to set this 244210/pfx folder so that we can install the game's dependencies</p>

> [!NOTE]
> If your game is on another disk or directory the path changes, e.g.: mine is on another disk in the location: `/run/media/user/mydisk/SteamLibrary/steamapps/compatdata/244210/pfx`, in this case you should replace the directory to that in the other disk.</p>
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks annihilate`<br>
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks dotnet48`<br>
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks d3dcompiler_47`<br>
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks vcrun2015`<br>
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winetricks dxvk`<br>
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx winecfg`<br>
With this command you will open winecfg, I recommend changing the "windows version" to: Windows 10, then you click on the libraries tab, type dwrite and then click on add and then click on apply.

If necessary, install Wine Mono manually, but usually Wine installs it by itself.  
Install Wine Mono for the version of Proton you are using from [WineHQ](https://dl.winehq.org/wine/wine-mono/), for example: For Proton 10.1, download the Wine 10.1 MSI installer.  
Once downloaded, run the next command:
`$ WINEPREFIX=~/.steam/steam/steamapps/compatdata/244210/pfx wine uninstaller`  
Once a window pops up, click on `install` and then select the wine-mono-XX-X-X-x86.msi file that was downloaded.   
After that install the latest version of [Proton GE](https://github.com/GloriousEggroll/proton-ge-custom), and put it to run on steam as the main Proton.  

> [!IMPORTANT]
> **See also:**
> - [Modding](modding.md)
> - [Online](online.md)
> - [Collaborators](thanks-to-collaborators.md)
> - [Configuration Used](.)
