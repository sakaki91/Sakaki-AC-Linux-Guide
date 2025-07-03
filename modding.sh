mkdir -p src
clear
echo "Select game directory: (e.g: ~/.steam/steam/steamapps/common/assettocorsa)"
echo "or if you have it on another disk, (e.g: /run/media/user/Disk/SteamLibrary/steamapps/common/assettocorsa)"
read -p "> " gamePrefix
clear
cd src/
wget https://acstuff.ru/app/latest.zip
wget https://acstuff.club/u/blob/ac-fonts.zip
unzip latest.zip
unzip ac-fonts.zip
cp Content\ Manager.exe "$(realpath "$gamePrefix")"
cp Manifest.json "$(realpath "$gamePrefix")"
cp -r system/ "$(realpath "$gamePrefix")"/content/fonts/
cd "$(realpath "$gamePrefix")"
mkdir -p Backup
cp "$(realpath "$gamePrefix")"/AssettoCorsa.exe "$(realpath "$gamePrefix")"/Backup/AssettoCorsa_original.exe
mv Content\ Manager.exe AssettoCorsa.exe
