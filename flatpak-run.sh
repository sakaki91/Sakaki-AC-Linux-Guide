# distros like lmde need third party configurations in addition to the script
rm -rf ~/.cache/winetricks
clear
echo "Select your game prefix (e.g: /home/sakaki/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/pfx)"
read -p "> " gamePrefix
clear
rm -rf "$gamePrefix"
echo Then the game will open, wait until it silently crashes and press enter
flatpak run com.valvesoftware.Steam steam://rungameid/244210
read
WINEPREFIX="$(realpath "$gamePrefix")" winetricks annihilate
WINEPREFIX="$(realpath "$gamePrefix")" winetricks dotnet48
WINEPREFIX="$(realpath "$gamePrefix")" winetricks d3dcompiler_47
WINEPREFIX="$(realpath "$gamePrefix")" winetricks vcrun2015
WINEPREFIX="$(realpath "$gamePrefix")" winetricks dxvk
clear
echo Press Enter to continue, then winecfg will automatically open in the chosen prefix, select the Windows 10 system version, and add dwrite.dll in the libraries tab!
read
WINEPREFIX="$(realpath "$gamePrefix")" winecfg
clear
flatpak run com.valvesoftware.Steam steam://rungameid/244210
echo The game will open normally now, enjoy!
echo "Now switch to the latest version of Proton (Hotflix or Experimental) or Proton GE for better experience"
echo ""
