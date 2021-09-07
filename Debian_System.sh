#!/bin/bash

#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */

# this are all of the application for the Debian System

#this will isntall debained system
function system_update_debian()
{
    #this will update and upgrade all of the bebained system
    sudo apt-get update
    sudo apt-get upgrade
    whiptail --title "Debian System" --msgbox "Your System is Updated." 8 45;
    Debian_system
}
function install_chromeium_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install chromium
        whiptail --title "Chromium" --msgbox "Chromium is Installed on this system." 8 45;
    else  
        enable_Snap_Store_debian
        sudo snap install chromium
        whiptail --title "Chromium" --msgbox "Chromium is Installed on this system." 8 45;
    fi
    Debian_system
}
function install_firefox_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install firefox
        whiptail --title "Firefox" --msgbox "Firefox is Installed on this system." 8 45;
    else  
        enable_Snap_Store_debian
        sudo snap install firefox
        whiptail --title "Firefox" --msgbox "Firefox is Installed on this system." 8 45;
    fi
    Debian_system
}
function enable_Snap_Store_debian()
{
    sudo apt install snapd
    sudo snap install snap-store
    Debian_system
}
function install_java_JDK_debian()
{
    sudo apt-get install openjdk-8-jdk
    whiptail --title "Java JDK" --msgbox "Java JDK is Installed." 8 45;
    Debian_system
}
function install_netbeans_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        #this will install netbeans using snap store 
        sudo snap install netbeans --classic
        whiptail --title "Netbean" --msgbox "Netbean IDE is Installed." 8 45;
    else 
        enable_Snap_Store_debian
        sudo snap install netbeans --classic
        whiptail --title "Netbean" --msgbox "Netbean IDE is Installed." 8 45;
    fi
    Debian_system
}
function install_spotify_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        #this will install netbeans using snap store 
        sudo snap install spotify
        whiptail --title "Spotify" --msgbox "Spotify is Installed." 8 45;
    else 
        enable_Snap_Store_debian
        sudo snap install spotify
        whiptail --title "Spotify" --msgbox "Spotify is Installed." 8 45;
    fi
    Debian_system
}
function install_Android_Studio_Debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        #this will install android Studio using snap store 
        sudo snap install android-studio --classic
        whiptail --title "Android Studio" --msgbox "Android Studio is Installed." 8 45;
    else 
        enable_Snap_Store_debian
        sudo snap install android-studio --classic
        whiptail --title "Android Studio" --msgbox "Android Studio is Installed." 8 45;
    fi
    Debian_system
}

function install_visual_Studio_code_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install code --classic
        whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is Installed." 8 45;
    else 
        enable_Snap_Store_debian
        sudo snap install code --classic
        whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is Installed." 8 45;
    fi
    Debian_system
}
function install_discord_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install discord
        whiptail --title "Discord" --msgbox "Discord is Installed." 8 45;
    else 
        enable_Snap_Store_debian
        sudo snap install discord
        whiptail --title "Discord" --msgbox "Discord is Installed." 8 45;
    fi
    Debian_system
}
function install_teams_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install teams
        whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is Installed." 8 45;
    else 
        enable_Snap_Store_debian
        sudo snap install teams
        whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is Installed." 8 45;
    fi
    Debian_system
}
function install_onlyoffice_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install onlyoffice-desktopeditors
        whiptail --title "Only Office Suite" --msgbox "Only Office Suite is Installed." 8 45;
    else 
        enable_Snap_Store_debian
        sudo snap install onlyoffice-desktopeditors
        whiptail --title "Only Office Suite" --msgbox "Only Office Suite is Installed." 8 45;
    fi
    Debian_system
}
function install_notion_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install notion-snap
        whiptail --title "Notion" --msgbox "Notion is Installed." 8 45;
    else 
        enable_Snap_Store_debian
        sudo snap install notion-snap
        whiptail --title "Notion" --msgbox "Notion is Installed." 8 45;
    fi
    Debian_system
}
function install_bitwarden_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install bitwarden
        whiptail --title "Bitwarden" --msgbox "Bitwarden is Installed." 8 45;
    else 
        enable_Snap_Store_debian
        sudo snap install bitwarden
        whiptail --title "Bitwarden" --msgbox "Bitwarden is Installed." 8 45;
    fi
    Debian_system
}
function install_brave_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install brave
        whiptail --title "Brave" --msgbox "Brave is Installed on this system." 8 45;
    else 
        enable_Snap_Store_debian
        sudo snap install brave
        whiptail --title "Brave" --msgbox "Brave is Installed on this system." 8 45;
    fi
    Debian_system
}
function install_sublime_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install sublime-text --classic
        whiptail --title "Sublime Text Editior" --msgbox "Sublime Text Editior is Installed on this system." 8 45;
    else  
        enable_Snap_Store_debian
        sudo snap install sublime-text --classic
        whiptail --title "Sublime Text Editior" --msgbox "Sublime Text Editior is Installed on this system." 8 45;
    fi
    Debian_system
}
function install_atom_debian()
{
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install atom --classic
        whiptail --title "Atom" --msgbox "Atom is Installed on this system." 8 45;
    else  
        enable_Snap_Store_debian
        sudo snap install atom --classic
        whiptail --title "Atom" --msgbox "Atom is Installed on this system." 8 45;
    fi
    Debian_system
}
function All_Application_Installer_debian()
{
    system_update_debian
    install_java_JDK_debian
    install_netbeans_debian
    install_spotify_debian
    install_Android_Studio_Debian
    install_visual_Studio_code_debian
    install_discord_debian
    install_teams_debian
    install_onlyoffice_debian
    install_notion_debian
    install_bitwarden_debian
    install_chromeium_debian
    install_firefox_debian
    install_brave_debian
    install_sublime_debian
    install_atom_debian
    system_update_debian
    whiptail --title "All Applications" --msgbox "All Application are Installed Installed." 8 45;
    Debian_system
}

function Debian_system()
{
    txtback='Yes';
    while :; do
        ADVSEL=$(whiptail --title "Application Installer for Debian System" --fb --menu "Choose an option" --cancel-button "${txtback} Back" 25 60 15 \
            "1" "Update Debian system" \
            "2" "Install Java JDK" \
            "3" "Install Netbeans" \
            "4" "Install Spotify" \
            "5" "Install Android Studio" \
            "6" "Install Visual Studio Code" \
            "7" "Install Discord" \
            "8" "Install Microsoft Teams" \
            "9" "Install Only Office" \
            "10" "Install Notion" \
            "11" "Install Bitwarden" \
            "12" "Install Chromium" \
            "13" "Install Firefox" \
            "14" "Install Brave" \
            "15" "Install Atom" \
            "16" "Install Sublime" \
            "17" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to update your System?." 10 60) 
                then
                    system_update_debian
                else
                    whiptail --title "Debian System" --msgbox "Ypur System is not Updated!" 8 45;
                fi
                ;;
            2)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Java JDK?." 10 60) 
                then
                    install_java_JDK_debian
                else
                    whiptail --title "Java JDK" --msgbox "Java JDK is not Installed" 8 45;
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Netbean?." 10 60) 
                then
                    install_netbeans_debian
                else
                    whiptail --title "Netbeans" --msgbox "netbeans is not Installed" 8 45;
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Spotify?." 10 60) 
                then
                    install_spotify_debian
                else
                    whiptail --title "Spotify" --msgbox "Spotify is not Installed" 8 45;
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Android Studio?." 10 60) 
                then
                    install_Android_Studio_Debian
                else
                    whiptail --title "Android Studio" --msgbox "Android Studio is not Installed" 8 45;
                fi
                ;;
            6)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Visual Studio Code?." 10 60) 
                then
                    install_visual_Studio_code_debian
                else
                    whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is not Installed" 8 45;
                fi
                ;;
            7)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Discord?." 10 60) 
                then
                    install_discord_debian
                else
                    whiptail --title "Discord" --msgbox "Discord is not Installed" 8 45;
                fi
                ;;
            8)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Microsoft Teams?." 10 60) 
                then
                    install_teams_debian
                else
                    whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is not Installed" 8 45;
                fi
                ;;
            9)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Only Office Suite?." 10 60) 
                then
                    install_onlyoffice_debian
                else
                    whiptail --title "Only office Suite" --msgbox "Only Office Suite is not Installed" 8 45;
                fi
                ;;
            10)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Notion?." 10 60) 
                then
                    install_notion_debian
                else
                    whiptail --title "Notion" --msgbox "Notion is not Installed" 8 45;   
                fi
                ;;
            11)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Bitwarden?." 10 60) 
                then
                    install_bitwarden_debian
                else
                    whiptail --title "Bitwarden" --msgbox "Bitwarden is not Installed" 8 45;   
                fi
                ;;
            12)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Chromium?." 10 60) 
                then
                    install_chromeium_debian
                else
                    whiptail --title "Bitwarden" --msgbox "Bitwarden is not Chromium" 8 45;   
                fi
                ;;
            13)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Firefox?." 10 60) 
                then
                    install_firefox_debian
                else
                    whiptail --title "Bitwarden" --msgbox "Bitwarden is not Firefox" 8 45;   
                fi
                ;;
          14)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Brave?." 10 60) 
                then
                    install_brave_debian
                else
                    whiptail --title "Brave" --msgbox "Brave is not Installed" 8 45;   
                fi
                ;;
            15)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Atom?." 10 60) 
                then
                    install_atom_debian
                else
                    whiptail --title "Atom" --msgbox "Atom is not Installed" 8 45;   
                fi
                ;;
            16)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Sublime?." 10 60) 
                then
                    install_sublime_debian
                else
                    whiptail --title "Sublime" --msgbox "Sublime is not Installed" 8 45;   
                fi
                ;;
            17)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All_Application_Installer_debian
                else
                    whiptail --title "All Applications" --msgbox "No Application are Installed" 8 45;   
                fi
        esac

        if(txtback=="Yes")
        then
            choice_Menu
        fi
        
    done 
}