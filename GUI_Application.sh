#!/bin/bash
#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */


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
FILE=/var/lib/snapd/snaps

#The file location for the flatpak or FlatHib
FLATPAK_FILE=/etc/profile.d/flatpak-bindir.sh

#Location for the yay on the arch system
YAY_LOCATION=/usr/bin/yay

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

# All of the Store which are required:

#Snap Store
function install_Snap_store()
{  
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S snapd
        sudo systemctl enable --now snapd.socket
        sudo ln -s /var/lib/snapd/snap /snap  
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install snapd
        sudo snap install snap-store 
       #echo 'system is debian'
    else
        whiptail --title "Error" --msgbox "Your OS is Not Supported!!!!" 8 45;
        exit 0
    fi
}

# Flathub store
function flatpak_store()
{
    if [[ "$package_manager" == "pacman" ]];
    then 
        sudo pacman -S flatpak
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
         sudo apt install flatpak
       #echo 'system is debian'
    else
        whiptail --title "Error" --msgbox "Your OS is Not Supported!!!!" 8 45;
        exit 0
    fi
}

#Yay for the Arch Linux.
function yay()
{
    sudo pacman -S yay
}

# Update Category

# system Update:
function system_update()
{      
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -Syyu
        splash 'System is updated'
        #whiptail --title "System Updater" --msgbox "Your System is up to date" 8 45;
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt-get update
        sudo apt-get upgrade
        splash 'System is Updated'
        #whiptail --title "System Updater" --msgbox "Your System is up to date" 8 45;
        #echo 'system is debian'
    else
        echo 'System is Not Supported!!'
        exit 0
    fi
}

function snap-update()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap refresh 
        splash 'Snap Packages are Upto Date'
        whiptail --title "Snap Packages" --msgbox "Snap Packages are Upto Date." 8 45;
    else  
        install_Snap_store
        sudo snap refresh 
        splash 'Snap Packages are Upto Date'
        whiptail --title "Snap Packages" --msgbox "Snap Packages are Upto Date." 8 45;
    fi
}
function flathub-update()
{
    if [ -e "$FLATPAK_FILE" ]; 
    then
        sudo flatpak update
        splash 'FlatpHub Packages are Upto Date'
        #whiptail --title "FlatHub Packages" --msgbox "FlatHub Packages are Upto Date." 8 45;
    else  
        flatpak_store
        sudo flatpak update
        splash 'FlatpHub Packages are Upto Date'
        #whiptail --title "FlatHub Packages" --msgbox "FlatHub Packages are Upto Date." 8 45;
    fi
}
function yay-update()
{
    if [ -e "$YAY_LOCATION" ]; 
    then
        yay -Syyu
        splash 'Yay Packages are Upto Date'
        #whiptail --title "Yay Packages" --msgbox "Yay Packages are Upto Date." 8 45;
    else  
        yay
        yay -Syyu
        splash 'Yay Packages are Upto Date'
        #whiptail --title "Yay Packages" --msgbox "Yay Packages are Upto Date." 8 45;
    fi
}
#this will update all of the application
function update-all-system()
{
    system_update
    snap-update
    flathub-update
    yay-update
    splash 'Your System is updated'
    whiptail --title "System Update" --msgbox "Your System is Updated." 8 45;
}

# Browswe Category

#Chromium
function chromum()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install chromium
        splash 'Chromium Browser is Installed'
        whiptail --title "Chromium" --msgbox "Chromium is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install chromium
        splash 'Chromium Browser is Installed'
        whiptail --title "Chromium" --msgbox "Chromium is Installed on this system." 8 45;
    fi
}
#firefox
function firefox()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install firefox
        splash 'Firefox Browser is Installed'
        whiptail --title "Firefox" --msgbox "Firefox is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install firefox
        splash 'Firefox Browser is Installed'
        whiptail --title "Firefox" --msgbox "Firefox is Installed on this system." 8 45;
    fi
}
#brave
function brave()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install brave
        splash 'Brave Browser is Installed'
        whiptail --title "Brave" --msgbox "Brave is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install brave
        splash 'Brave Browser is Installed'
        whiptail --title "Brave" --msgbox "Brave is Installed on this system." 8 45;
    fi
}
# Google chrome
function google-chrome()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        if [ -e "$YAY_LOCATION" ]; 
        then
            sudo yay google-chrome
            splash 'Google Chrome Browser is Installed'
            whiptail --title "Google Chrome" --msgbox "Google Chrome is Installed on this system." 8 45;
        else  
            yay
            sudo yay google-chrome
            splash 'Google Chrome Browser is Installed'
            whiptail --title "Google Chrome" --msgbox "Google Chrome is Installed on this system." 8 45;
        fi
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo apt install ./google-chrome-stable_current_amd64.deb
       #echo 'system is debian'
    else
        whiptail --title "Error" --msgbox "Your OS is Not Supported!!!!" 8 45;
    fi
}


# TEXT Editior Category

#Atom
function atom()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install atom --classic
        splash 'Atom Text Editior is Installed'
        whiptail --title "Atom" --msgbox "Atom is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install atom --classic
        splash 'Atom Text Editior is Installed'
        whiptail --title "Atom" --msgbox "Atom is Installed on this system." 8 45;
    fi
}

# Sublime
function sublime()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install sublime-text --classic
         splash 'Sublime Text Editior is Installed'
        whiptail --title "Sublime Text Editior" --msgbox "Sublime Text Editior is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install sublime-text --classic
         splash 'Sublime Text Editior is Installed'
        whiptail --title "Sublime Text Editior" --msgbox "Sublime Text Editior is Installed on this system." 8 45;
    fi
}

#brackets
function brackets()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install brackets --classic
        splash 'Brackets Text Editior is Installed'
        whiptail --title "Brackets Text Editior" --msgbox "Brackets Text Editior is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install brackets --classic
        splash 'Brackets Text Editior is Installed'
        whiptail --title "Brackets Text Editior" --msgbox "Brackes Text Editior is Installed on this system." 8 45;
    fi
}

# visual Studio code
function vs_code()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install code --classic
        splash 'Visual Studio Code is Installed'
        whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is Installed." 8 45;
    else 
        install_Snap_store
        sudo snap install code --classic
        splash 'Visual Stidio Code is Installed'
        whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is Installed." 8 45;
    fi
}

#notion
function notion()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install notion-snap
        splash 'Notion is Installed'
        whiptail --title "Notion" --msgbox "Notion is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install notion-snap
        splash 'Notion is Installed'
        whiptail --title "Notion" --msgbox "Notion is Installed on this system." 8 45;
    fi
}


# MultiMedia Category

#vlc
function vlc()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install vlc
        splash 'VLC Video Players is Installed'
        whiptail --title "VLC Video Player" --msgbox "VLC Video Player is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install vlc
        splash 'VLC Video Players is Installed'
        whiptail --title "VLC Video Player" --msgbox "VLC Video Player is Installed on this system." 8 45;
    fi
}

#pluse Audio
function pluseAudio()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install pulseaudio
        splash 'Pluse Audio is Installed'
        whiptail --title "Pluse Audio" --msgbox "Pluse Audio is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install pulseaudio
        splash 'Pluse Audio is Installed'
        whiptail --title "Pluse Audio" --msgbox "Pluse Audio is Installed on this system." 8 45;
    fi
}

#rythmox
function rythmobox()
{
    if [ -e "$FLATPAK_FILE" ]; 
    then
        sudo flatpak install flathub org.gnome.Rhythmbox3
        splash 'Rythmobox Audio is Installed'
        whiptail --title "Rythmobox Audio" --msgbox "Rythmobox Audio is Installed on this system." 8 45;
    else  
        flatpak_store
        sudo flatpak install flathub org.gnome.Rhythmbox3
        splash 'Rythmobox Audio is Installed'
        whiptail --title "Rythmobox" --msgbox "Rythmobox Audio is Installed on this system." 8 45;
    fi  
}


# Development Section

#Android Studio
function android_studio()
{
    if [ -e "$FILE" ]; 
    then
        sudo ln -s /var/lib/snapd/snap /snap
        sudo snap install android-studio --classic
        splash 'Android Studio is Installed'
        whiptail --title "Android Studio" --msgbox "Android Studio is Installed on this system." 8 45;
    else 
        install_Snap_store
        sudo snap install android-studio --classic
        splash 'Android Studio is Installed'
        whiptail --title "Android Studio" --msgbox "Android Studio is Installed on this system." 8 45;
    fi
}

#java JDK
function java_JDK()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S jre8-openjdk-headless jre8-openjdk jdk8-openjdk openjdk8-doc openjdk8-src
        whiptail --title "Java JDK" --msgbox "Java JDK is Installed." 8 45;
        splash 'Java JDK is Installed'
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt-get install openjdk-8-jdk
        whiptail --title "Java JDK" --msgbox "Java JDK is Installed." 8 45;
        splash 'Java JDK is Installed'
       #echo 'system is debian'
    else
        whiptail --title "Error" --msgbox "Your OS is Not Supported!!!!" 8 45;
    fi
}

# Netbean
function netbean()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        if [ -e "$FILE" ]; 
        then
            sudo ln -s /var/lib/snapd/snap /snap
            sudo snap install netbeans --classic
            splash 'Neabean is Installed'
            whiptail --title "Netbeans" --msgbox "Netbeans is Installed on this system." 8 45;
        else 
            install_Snap_store
            sudo ln -s /var/lib/snapd/snap /snap
            sudo snap install netbeans --classic
            splash 'Neabean is Installed'
            whiptail --title "Netbeans" --msgbox "Netbeans is Installed on this system." 8 45;
        fi
       #echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        if [ -e "$FILE" ]; 
        then
            sudo snap install netbeans --classic
            splash 'Neabean is Installed'
            whiptail --title "Netbean" --msgbox "Netbean IDE is Installed." 8 45;
        else 
            install_Snap_store
            sudo snap install netbeans --classic
            splash 'Neabean is Installed'
            whiptail --title "Netbean" --msgbox "Netbean IDE is Installed." 8 45;
        fi
       #echo 'system is debian'
    else
        whiptail --title "Error" --msgbox "Your OS is Not Supported!!!!" 8 45;
        
    fi
}

#Eclipse
function eclipse()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install eclipse --classic
        splash 'Eclipse is Installed'
        whiptail --title "Eclipse" --msgbox "Eclipse is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install eclipse --classic
        splash 'Eclipse is Installed'
        whiptail --title "Eclipse" --msgbox "Eclipse is Installed on this system." 8 45;
    fi
}


#GithHub Desktop
function github_desktop()
{
    if [ -e "$FLATPAK_FILE" ]; 
    then
        sudo flatpak install flathub io.github.shiftey.Desktop
        splash 'GitHub Desktop is Installed'
        whiptail --title "GitHub Desktop" --msgbox "GitHub Desktop is Installed on this system." 8 45;
    else  
        flatpak_store
        sudo flatpak install flathub io.github.shiftey.Desktop
        splash 'GitHub Desktop is Installed'
        whiptail --title "GitHub Desktop" --msgbox "GitHub Desktop is Installed on this system." 8 45;
    fi
}

#pychar
function pycharm()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install pycharm-community --classic
        splash 'Pycharm is Installed'
        whiptail --title "Pycharm" --msgbox "Pycharm is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install pycharm-community --classic
        splash 'Pycharm is Installed'
        whiptail --title "Pycharm" --msgbox "Pycharm is Installed on this system." 8 45;
    fi
}

#Flutter
function flutter()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install flutter --classic
        splash 'Flutter is Installed'
        whiptail --title "Flutter" --msgbox "Pycharm is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install flutter --classic
        splash 'Flutter is Installed'
        whiptail --title "Flutter" --msgbox "Pycharm is Installed on this system." 8 45;
    fi  
}

#Powershell
function powershell()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        if [ -e "$YAY_LOCATION" ]; 
        then
            sudo yay -S powershell-bin  
            splash 'Power Shell is Installed'
            whiptail --title "Power Shell" --msgbox "Power Shell is Installed on this system." 8 45;
        else  
            yay
            sudo yay -S powershell-bin  
            splash 'Power Shell is Installed'
            whiptail --title "Power Shell" --msgbox "Power Shell is Installed on this system." 8 45;
        fi
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        # Update the list of packages
        sudo apt-get update
        # Install pre-requisite packages.
        sudo apt-get install -y wget apt-transport-https software-properties-common
        # Download the Microsoft repository GPG keys
        wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
        # Register the Microsoft repository GPG keys
        sudo dpkg -i packages-microsoft-prod.deb
        # Update the list of products
        sudo apt-get update
        # Enable the "universe" repositories
        sudo add-apt-repository universe
        # Install PowerShell
        sudo apt-get install -y powershell 
       #echo 'system is debian'
    else
        whiptail --title "Error" --msgbox "Your OS is Not Supported!!!!" 8 45;
    fi
}

# python3
function python()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S python
        splash 'Python 3 is Installed'
        whiptail --title "Python" --msgbox "Python is Installed on this system." 8 45;
            
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo apt install -y python3-pip
        splash 'Python 3 is Installed'
        whiptail --title "Python" --msgbox "Python is Installed on this system." 8 45;
       #echo 'system is debian'
    else
        whiptail --title "Error" --msgbox "Python is not installed on your System" 8 45;
    fi
}

# Office Suite Category

#Only Office
function only_office()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install onlyoffice-desktopeditors
        splash 'Only Office Suite is Installed'
        whiptail --title "Only Office Suite" --msgbox "Only Office Suite is Installed on this system." 8 45;
    else 
        install_Snap_store
        sudo snap install onlyoffice-desktopeditors
        splash 'Only Office Suite is Installed'
        whiptail --title "Only Office Suite" --msgbox "Only Office Suite is Installed on this system." 8 45;
    fi
}

# Libre Office
function libreoffice()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install libreoffice
        splash 'Libre Office is Installed'
        whiptail --title "Libre Office" --msgbox "Libre Office is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install libreoffice
        splash 'Libre Office is Installed'
        whiptail --title "Libre Office" --msgbox "Libre Office is Installed on this system." 8 45;
    fi
}

#WPS Suite
function WPS()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install wps-2019-snap
        splash 'WPS Office is Installed'
        whiptail --title "WPS Office" --msgbox "WPS Office is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install wps-2019-snap
        splash 'WPS Office is Installed'
        whiptail --title "WPS Office" --msgbox "WPS Office is Installed on this system." 8 45;
    fi
}

# Conference Call Category


#discord
function discord()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install discord
        splash 'Discord is Installed'
        whiptail --title "Discord" --msgbox "Discord is Installed." 8 45;
    else 
        install_Snap_store
        splash 'Discord is Installed'
        sudo snap install discord
        whiptail --title "Discord" --msgbox "Discord is Installed." 8 45;
    fi
}

#Microsoft Teams
function ms_teams()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install teams
        splash 'Microsoft Teams is Installed'
        whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is Installed." 8 45;
    else 
        install_Snap_store
        sudo snap install teams
        splash 'Microsft Teams is Installed'
        whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is Installed." 8 45;
    fi
}

#Zoom
function zoom()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install zoom-client
        splash 'Zoom is Installed'
        whiptail --title "Zoom" --msgbox "Zoom is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install zoom-client
        splash 'Zoom is Installed'
        whiptail --title "Zoom" --msgbox "Zoom is Installed on this system." 8 45;
    fi
}

#Signal Desktop
function signal-desktop()
{

    if [ -e "$FILE" ]; 
    then
        sudo snap install signal-desktop
        splash 'Signal Desktop is Installed'
        whiptail --title "Signal Desktop" --msgbox "Signal Desktop is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install signal-desktop
        splash 'Signal Desktop is Installed'
        whiptail --title "Signal Desktop" --msgbox "Signal Desktop is Installed on this system." 8 45;
    fi
}

#Telegram Desktop
function telegram-desktop()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install telegram-desktop
        splash 'Telegram Desktop is Installed'
        whiptail --title "Telegram Desktop" --msgbox "Telegram Desktop is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install telegram-desktop
        splash 'Telegram Desktop is Installed'
        whiptail --title "Telegram Desktop" --msgbox "Telegram Desktop is Installed on this system." 8 45;
    fi  
}


# Graphic Work Categoty

#Obs
function obs()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install obs-studio
        splash 'OBS is Installed'
        whiptail --title "OBS" --msgbox "OBS is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install obs-studio
        splash 'OBS is Installed'
        whiptail --title "OBS" --msgbox "OBS is Installed on this system." 8 45;
    fi    
}

# KDenlive
function kdenlive()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install kdenlive
        splash 'Kdenlive is Installed'
        whiptail --title "Kdenlive" --msgbox "Kdenlive is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install kdenlive
        splash 'Kdenlive is Installed'
        whiptail --title "Kdenlive" --msgbox "Kdenlive is Installed on this system." 8 45;
    fi
}

#gimp
function gimp()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install gimp
        splash 'GIMP is Installed'
        whiptail --title "GIMP" --msgbox "GIMP is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install gimp
        splash 'GIMP is Installed'
        whiptail --title "GIMP" --msgbox "GIMP is Installed on this system." 8 45;
    fi
}

#blender
function blender()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install blender --classic
        splash 'Blender is Installed'
        whiptail --title "Blender" --msgbox "Blender is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install blender --classic
        splash 'Blender is Installed'
        whiptail --title "Blender" --msgbox "Blender is Installed on this system." 8 45;
    fi
}


# Audio and Music Category

# spotify
function spotify()
{
    if [ -e "$FILE" ]; 
    then       
        sudo snap install spotify
        splash 'Spotify is Installed'
        whiptail --title "Spotify" --msgbox "spotify is Installed on this system." 8 45;
    else 
        install_Snap_store
        sudo snap install spotify
        splash 'Spotify is Installed'
        whiptail --title "Spotify" --msgbox "Spotify is Installed on this system." 8 45;
    fi
}
#Apple Music
function apple-music()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install apple-music-for-linux
        splash 'Apple Music is Installed'
        whiptail --title "Apple Music" --msgbox "Apple Music is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install apple-music-for-linux
        splash 'Apple Music is Installed'
        whiptail --title "Apple Music" --msgbox "Apple Music is Installed on this system." 8 45;
    fi
}

# Audacity
function audacity()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install audacity
        splash 'Audacity is Installed'
        whiptail --title "Audacity" --msgbox "Audacity is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install audacity
        splash 'Audacity is Installed'
        whiptail --title "Audacity" --msgbox "Audacity is Installed on this system." 8 45;
    fi
}

#Plex Media Server
function plex-media-server()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install plexmediaserver
        splash 'Plex Media Server is Installed'
        whiptail --title "Plex Media Server" --msgbox "Plex Media Server is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install plexmediaserver
        splash 'Plex Media Server is Installed'
        whiptail --title "Plex Media Server" --msgbox "Plex Media Server is Installed on this system." 8 45;
    fi    
}

# Cloud Service Category

#Next Cloud
function next-cloud()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install audacity
        splash 'Next Cloud is Installed'
        whiptail --title "Next Cloud" --msgbox "Next Cloud is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install audacity
        splash 'Next Cloud is Installed'
        whiptail --title "Next Cloud" --msgbox "Next Cloud is Installed on this system." 8 45;
    fi
}

function google--sdk-cloud()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install google-cloud-sdk --classic
        splash 'Google SDK Cloud is Installed'
        whiptail --title "Google SDK Cloud" --msgbox "Google SDK Cloud is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install google-cloud-sdk --classic
        splash 'Google SDK Cloud is Installed'
        whiptail --title "Google SDK Cloud" --msgbox "Google SDK Cloud is Installed on this system." 8 45;
    fi
}


# Essencial Category

# bitwarden
function bitwarden()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install bitwarden
        splash 'Bitwarden is Installed'
        whiptail --title "Bitwarden" --msgbox "Bitwarden is Installed on this system." 8 45;
    else 
        install_Snap_store 
        sudo snap install bitwarden
        splash 'Bitwarden is Installed'
        whiptail --title "Bitwarden" --msgbox "Bitwarden is Installed on this system." 8 45;
    fi
}

#mail Spring
function mailspring()
{   
    if [ -e "$FILE" ]; 
    then
        sudo snap install mailspring
        splash 'MailSpring is Installed'
        whiptail --title "MailSpring" --msgbox "MailSpring is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install mailspring
        splash 'MailSpring is Installed'
        whiptail --title "MailSpring" --msgbox "MailSpring is Installed on this system." 8 45;
    fi
}
#slack
function slack()
{
    if [ -e "$FILE" ]; 
    then
        sudo snap install slack --classic
        splash 'Slack is Installed'
        whiptail --title "Slack" --msgbox "Slack is Installed on this system." 8 45;
    else  
        install_Snap_store
        sudo snap install slack --classic
        splash 'Slack is Installed'
        whiptail --title "Slack" --msgbox "Slack is Installed on this system." 8 45;
    fi    
}

# stacer
function stacer()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo yay stacer
        splash 'Slack is Installed'
        whiptail --title "Slack" --msgbox "Slack is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo apt install stacer
        splash 'Stacer is Installed'
        whiptail --title "Stacer" --msgbox "Stacer is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Stacer can not be installed on your system!!!!" 8 45;
    fi
}


#Game Category

#steam
function steam()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S steam 
        splash 'Steam is Installed'
        whiptail --title "Steam" --msgbox "Steam is Installed on this system." 8 45; 
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo add-apt-repository multiverse
        sudo apt-get update
        sudo apt-get install steam 
        splash 'Steam is Installed'
        whiptail --title "Steam" --msgbox "Steam is Installed on this system." 8 45;
       #echo 'system is debian'
    else
        whiptail --title "Error" --msgbox "Sorry!! Steam is not installed on your system" 8 45;
        
    fi
}

#wine
function wine()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S wine
        sudo pacman -S winetricks
        sudo pacman -S wine-mono wine_gecko
        splash 'Wine is Installed'
        whiptail --title "Wine" --msgbox "Wine is Installed on this system." 8 45;
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo dpkg --add-architecture i386
        sudo apt update
        wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
        sudo apt install software-properties-common
        sudo apt-add-repository "deb http://dl.winehq.org/wine-builds/ubuntu/ $(lsb_release -cs) main"
        sudo apt install --install-recommends winehq-stable
        splash 'Wine is Installed'
        whiptail --title "Wine" --msgbox "Wine is Installed on this system." 8 45;
       #echo 'system is debian'
    else
        whiptail --title "Error" --msgbox "Wine is not Installed on this system" 8 45;
        
    fi
}




# Install All Application 
function All_Application()
{
    # Browser Category
    chromum
    firefox
    brave
    google-chrome    
    
    #Text Editior Category
    sublime
    vs_code
    atom
    brackets
    notion

    #Multimedia Category
    rythmobox
    vlc
    pluseAudio

    #development
    android_studio
    netbean
    github_desktop
    pycharm
    eclipse
    flutter
    powershell
    java_JDK
    python

    #office Suite
    WPS
    only_office
    libreoffice

    #conference call
    ms_teams
    zoom
    signal-desktop
    discord
    telegram-desktop

    #graphic Work
    obs
    kdenlive
    blender
    gimp

    #music and audio 
    apple-music
    spotify
    audacity
    plex-media-server

   #Cloud and service
   next-cloud
   google--sdk-cloud

   #games
   steam
   wine
   
   #essencial
   bitwarden
   mailspring
   slack
   stacer
    
    #this will update all of the system
    update-all-system
    whiptail --title "All Applications" --msgbox "All Application are Installed Installed." 8 45;
}


