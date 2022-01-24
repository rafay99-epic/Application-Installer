#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */


# this will install and check for all of the compoents for the script.

. splash.sh

#this will import the file check which package manager you are running
. check-manager.sh

#File location for the snap store
SNAP=/var/lib/snapd/snaps

#The file location for the flatpak or FlatHub for arch
FLATPAK_FILE=/etc/profile.d/flatpak-bindir.sh

#the file location for debian.
FLATPAK_FILE_DEBIAN=/usr/bin/flatpak

#Location for the yay on the arch system
YAY_LOCATION=/usr/bin/yay

#Location of pamac AUR helper
PAMAC=/usr/bin/pamac

#Loction of Git
GIT=/usr/bin/git

#Location for the curl
CURL=/usr/bin/curl


#check for the snap store
function snap()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        yay
        pamac
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        if [ ! -e "$SNAP" ]; 
        then
            sudo apt install snapd
            sudo snap install snap-store 
        else  
            splash "Snap Is already Installed"
        fi
    else
        echo 'Importamt compoent is not Installed!!!!'
        exit 0
    fi
}

#check for the flathub
function flathub()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        if [ ! -e "$FLATPAK_FILE" ]; 
        then
            sudo pacman -S flatpak
        else  
            splash "FlatHub Is already Installed"
        fi
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        if [ ! -e "$FLATPAK_FILE_DEBIAN" ]; 
        then
            sudo apt install flatpak
            sudp apt-get update
            sudo apt-get upgrade
            sudo apt install gnome-software-plugin-flatpak
            sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        else  
            splash "FlatHub Is already Installed"
        fi
    else
        echo 'Importamt compoent is not Installed!!!!'
        exit 0
    fi
}

#check for yay AUR Helper
function yay()
{ 
    if [ ! -e "$YAY_LOCATION" ]; 
    then
        sudo pacman -S yay
    else
        splash "Yay Aur Helper is in the system"
    fi

}
function pamac()
{
    if [ ! -e "$PAMAC" ]; 
    then
        sudo pacman -S pamac
    else
        splash "Yay Aur Helper is in the system"
    fi
}
# #check for git
function git()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        if [ ! -f "$GIT" ]; 
        then
            sudo pacman -S git
        else
            echo ''
            splash "Git is in the system"
            echo ''
        fi
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        if [ ! -f "$GIT" ]; 
        then
            sudo apt-get update
            sudo apt-get install git
        else
            echo ''
            splash "Git is in the system"
            echo ''
        fi
    else
        echo 'System is Not Supported!!'
        exit 0
    fi
}

# #check for curl
function curl()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        if [ ! -f "$CURL" ]; 
        then
            sudo pacman -Sy curl 
        else
            echo ''
            splash "CURL is in the system"
            echo ''
        fi
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        if [ ! -f "$CURL" ]; 
        then
            sudo apt-get update
            sudo apt-get install curl
        else
            echo ''
            splash "CURL is in the system"
            echo ''
        fi
    else
        echo 'System is Not Supported!!'
        exit 0
    fi
}
function repo()
{
    if [[ "$package_manager" == "apt-get" ]];
    then
        #brave browser repo
        sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

        #Flathub repo
        sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

        #Vs code repo
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        rm -f packages.microsoft.gpg

        #wine Repo
        sudo sh -c 'echo " deb https://dl.winehq.org/wine-builds/debian/ bullseye main" >> /etc/apt/sources.list.d/wine.list'
        wget -nc https://dl.winehq.org/wine-builds/winehq.key
        sudo apt-key add winehq.key
        sudo dpkg --add-architecture i386
        sudo apt update -y
        sudo apt upgrade -y

        #sublime text repo
        wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
        sudo apt install apt-transport-https
        echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

        # Enable the "universe" repositories
        sudo add-apt-repository universe

        #Signal Desktop Repo
        wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
        cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
        echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
        sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
    fi
}

function call-method()
{
    repo
    curl
    git
    snap
    flathub
}
