#!/bin/bash

modBaseDownload(){
    mkdir -p "$GAMEPATH"/{Temp,Backup} && cp "$GAMEPATH"/AssettoCorsa "$GAMEPATH"/Backup/AssettoCorsaBackup.exe
    [[ ! -f "$GAMEPATH"/AssettoCorsa_original.exe ]] && cp "$GAMEPATH"/AssettoCorsa.exe "$GAMEPATH"/AssettoCorsa_original.exe
    (
        cd "$GAMEPATH"/Temp
        wget -c https://acstuff.ru/app/latest.zip
        wget -c https://acstuff.club/u/blob/ac-fonts.zip
        unzip latest.zip
        [[ ! -d "$GAMEPATH"/content/fonts ]] && mkdir -p "$GAMEPATH"/content/fonts
        unzip ac-fonts.zip
        mv 'Content Manager.exe' "$GAMEPATH"/AssettoCorsa.exe
        mv system "$GAMEPATH"/content/fonts/
    )
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
modBaseDownload
while true; do
    if [[ $1 == "--native" ]]; then
        GAMEPATH="$HOME"/.local/share/Steam/steamapps/common/assettocorsa
        GAMEPREFIX="$HOME"/.local/share/Steam/steamapps/compatdata/244210/pfx
        dependencyInstall
        modBaseDownload
    elif [[ $1 == "--flatpak" ]]; then
        GAMEPATH="$HOME"/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/common/assettocorsa
        GAMEPREFIX="$HOME"/.var/app/com.valvesoftware.Steam/data/Steam/steamapps/compatdata/244210/pfx
        dependencyInstall
        modBaseDownload
    elif [[ $1 == "--custom" ]]; then
        GAMEPATH=$(zenity --file-selection --directory --title "Select the game folder.")
        GAMEPREFIX=$(zenity --file-selection --directory --title "Select the game's prefix folder (244210/pfx only).")
        clear
        while true; do
            printf "GAME PATH: $GAMEPATH\nGAME PREFIX: $GAMEPREFIX\n\n"
            read -p "Do you want to use these directories? [Y/n] " customDirConfirmation
            [[ -z $customDirConfirmation ]] && customDirConfirmation="y"
            if [[ $customDirConfirmation == "Y" || $customDirConfirmation == "y" ]]; then
                break
            elif [[ $customDirConfirmation == "N" || $customDirConfirmation == "n" ]]; then
                break 2
            else
                printf "ERROR: Invalid option\n"
                sleep 2
                clear
            fi
        done
        dependencyInstall
        modBaseDownload
    else
        cat .logo
        printf "\nERROR: Invalid option\n\nExamples:\n\n"
        printf "%-30s %0s\n" "./install --native" "Configures the locally installed game to be in the native Steam folder."
        printf "%-30s %0s\n" "./install --flatpak" "Configures the locally installed game to be in the flatpak Steam folder."
        printf "%-30s %0s\n\n" "./install --custom" "Configure the installed game to a different disk/partition."
        exit
    fi
done
