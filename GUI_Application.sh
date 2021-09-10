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


for f in ${!osInfo[@]}
do
    if [[ -f $f ]];
    then
         package_manager=${osInfo[$f]}
    fi
done

FILE=/var/lib/snapd/snaps

FLATPAK_FILE= /etc/profile.d/flatpak-bindir.sh

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
        exit 0
    fi
}
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
        exit 0
    fi
}
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
function system_update()
{      
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -Syyu
        splash 'System is updated'
        whiptail --title "System Updater" --msgbox "Your System is up to date" 8 45;
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt-get update
        sudo apt-get upgrade
        splash 'System is Updated'
        whiptail --title "System Updater" --msgbox "Your System is up to date" 8 45;
        #echo 'system is debian'
    else
        echo 'System is Not Supported!!'
        exit 0
    fi
}
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
#function google-chrome()
# {

#}

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





function All_Application()
{
    java_JDK
    netbean
    spotify
    android_studio
    vs_code
    discord
    ms_teams
    only_office
    notion
    bitwarden
    chromum
    firefox
    brave
    atom
    sublime
    system_update
    whiptail --title "All Applications" --msgbox "All Application are Installed Installed." 8 45;
}


