#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */


# this will install and check for all of the compoents for the script.


# this is very all of the package manager are placed
declare -A osInfo;
osInfo[/etc/debian_version]="apt-get"
osInfo[/etc/alpine-release]="apk"
osInfo[/etc/centos-release]="yum"
osInfo[/etc/fedora-release]="dnf"
osInfo[/etc/arch-release]="pacman"

#to find the which Os yo are running
for f in ${!osInfo[@]}
do
    if [[ -f $f ]];
    then
         package_manager=${osInfo[$f]}
    fi
done

#File location for the snap store
SNAP=/var/lib/snapd/snaps

#The file location for the flatpak or FlatHub for arch
FLATPAK_FILE=/etc/profile.d/flatpak-bindir.sh

#the file location for debian.
FLATPAK_FILE_DEBIAN=/usr/bin/flatpak

#Location for the yay on the arch system
YAY_LOCATION=/usr/bin/yay

#Location of pamac AUR helper
PAMAC= /usr/bin/pamac

#Loction of Git
GIT=/usr/bin/git

#Location for the curl
CURL=/usr/bin/curl

#these are buildin funtion for the GUI
function echo_title() {     echo -ne "\033[1;44;37m${*}\033[0m\n"; }
function echo_caption() {   echo -ne "\033[0;1;44m${*}\033[0m\n"; }
function echo_bold() {      echo -ne "\033[0;1;34m${*}\033[0m\n"; }
function echo_danger() {    echo -ne "\033[0;31m${*}\033[0m\n"; }
function echo_success() {   echo -ne "\033[0;32m${*}\033[0m\n"; }
function echo_warning() {   echo -ne "\033[0;33m${*}\033[0m\n"; }
function echo_secondary() { echo -ne "\033[0;34m${*}\033[0m\n"; }
function echo_info() {      echo -ne "\033[0;35m${*}\033[0m\n"; }
function echo_primary() {   echo -ne "\033[0;36m${*}\033[0m\n"; }
function echo_error() {     echo -ne "\033[0;1;31merror:\033[0;31m\t${*}\033[0m\n"; }
function echo_label() {     echo -ne "\033[0;1;32m${*}:\033[0m\t"; }
function echo_prompt() {    echo -ne "\033[0;36m${*}\033[0m "; }

#this will create a flash for user or enter baner
function splash() 
{
    local hr;
    hr=" **$(printf "%${#1}s" | tr ' ' '*')** ";
    echo_title "${hr}";
    echo_title " * $1 * ";
    echo_title "${hr}";
    
}

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



function call-method()
{
    curl
    git
    snap
    flathub
}
