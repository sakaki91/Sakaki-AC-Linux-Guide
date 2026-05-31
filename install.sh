#!/bin/bash
# @sakaki91 on GitHub!

primaryDependencyChecker(){
    dependencies=(wine winetricks wget unzip zenity)
    for cmd in "${dependencies[@]}"; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            printf "\e[0;91mERROR: $cmd not found\033[0m, install it and try again.\n" && exit 1
        fi
    done
}

CMBaseDownload(){
    mkdir -p "$GAMEPATH"/temp
    [[ ! -d "$GAMEPATH"/backup ]] && mkdir "$GAMEPATH"/backup
    [[ ! -f "$GAMEPATH"/backup/AssettoCorsaBackup.exe ]] && cp "$GAMEPATH"/AssettoCorsa.exe "$GAMEPATH"/backup/AssettoCorsaBackup.exe
    [[ ! -f "$GAMEPATH"/AssettoCorsa_original.exe ]] && cp "$GAMEPATH"/AssettoCorsa.exe "$GAMEPATH"/AssettoCorsa_original.exe
    (
        cd "$GAMEPATH"/temp
        wget -c https://acstuff.ru/app/latest.zip
        wget -c https://acstuff.club/u/blob/ac-fonts.zip
        unzip latest.zip
	unzip ac-fonts.zip
        [[ ! -d "$GAMEPATH"/content/fonts ]] && mkdir -p "$GAMEPATH"/content/fonts
        mv 'Content Manager.exe' "$GAMEPATH"/AssettoCorsa.exe
        mv system "$GAMEPATH"/content/fonts/
    )
    rm -rf "$GAMEPATH"/temp
    exit
}

dependencyInstall(){
    export WINEPREFIX="$GAMEPREFIX"
    winetricks annihilate
    winetricks -q dotnet48
    winetricks -q vcrun2015
    winetricks d3dcompiler_47
    winecfg /v win10
    wine reg add "HKEY_CURRENT_USER\Software\Wine\DllOverrides" /v dwrite /d native,builtin /f
}

primaryDependencyChecker
if [[ $1 == "--native" ]]; then
    GAMEPATH="$HOME"/.local/share/Steam/steamapps/common/assettocorsa
    GAMEPREFIX="$HOME"/.local/share/Steam/steamapps/compatdata/244210/pfx
    dependencyInstall
    CMBaseDownload
elif [[ $1 == "--flatpak" ]]; then
    GAMEPATH="$HOME"/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/common/assettocorsa
    GAMEPREFIX="$HOME"/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/pfx
    dependencyInstall
    CMBaseDownload
elif [[ $1 == "--custom" ]]; then
    GAMEPATH=$(zenity --file-selection --directory --title "Select the game folder.")
    GAMEPREFIX=$(zenity --file-selection --directory --title "Select the game's prefix folder (244210/pfx only).")
    if [[ -z $GAMEPATH || -z $GAMEPREFIX ]]; then
	    clear
	    printf "\e[0;91mERROR:\e[0m empty value.\n"
	    exit
    fi
    clear
    while true; do
        printf "GAME PATH: $GAMEPATH\nGAME PREFIX: $GAMEPREFIX\n\n"
        read -p "Do you want to use these directories? [Y/n] " customDirConfirmation
        [[ -z $customDirConfirmation ]] && customDirConfirmation="y"
        if [[ $customDirConfirmation == "Y" || $customDirConfirmation == "y" ]]; then
	    dependencyInstall
	    CMBaseDownload
        elif [[ $customDirConfirmation == "N" || $customDirConfirmation == "n" ]]; then
            break
        else
            printf "\e[0;91mERROR:\e[0m Invalid option.\n"
            sleep 2
            clear
        fi
    done
else
    printf "\n\e[0;91mERROR:\e[0m Invalid option.\n\nExamples:\n"
    printf "%-25s %0s\n" "./install --native" "Configures the locally installed game to be in the native Steam folder."
    printf "%-25s %0s\n" "./install --flatpak" "Configures the locally installed game to be in the flatpak Steam folder."
    printf "%-25s %0s\n\n" "./install --custom" "Configure the installed game to a different disk/partition."
    exit
fi
