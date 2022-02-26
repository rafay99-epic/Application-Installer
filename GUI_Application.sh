#!/bin/bash
#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */

#In thissection all the files will be imported from the source
. splash.sh
. check-manager.sh

# Update Category

# system Update:
function system_update()
{      
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -Syyu
        splash  'System is updated'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt-get update
        sudo apt-get upgrade
        splash 'System is Updated'
    else
        echo 'System is Not Supported!!'
        exit 0
    fi
}

function snap-update()
{
    #update all the application that are installed using snap store
    sudo snap refresh
    splash 'Snap Packages are Upto Date'
}
function flathub-update()
{   
    #The command will updateall the application using the flatpak
    sudo flatpak update
    splash 'Flatpak Packages are Upto Date'
}
function yay-update()
{
    #This will update the yay and all the application
    yay -Syyu
    splash 'Yay Packages are Upto Date'

}
#this will update all of the application
function update-all-system()
{   
    
    if [[ "$package_manager" == "pacman" ]];
    then
        system_update
        yay-update
        flathub-update
    elif [[ "$package_manager" == "apt-get" ]];
    then 
       snap-update
       flathub-update
    else
        whiptail --title "Allert!!" --msgbox "Sorry The application can not be installed" 8 45;
    fi
    splash 'Your System is updated'
    whiptail --title "System Update" --msgbox "Your System is Updated." 8 45;
}

# Browswe Category

#Chromium
function chromum()
{ 
    #New Code  
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo flatpak install flathub org.chromium.Chromium
        splash 'Chromium Browser is Installed'
        whiptail --title "Chromium" --msgbox "Chromium is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install chromium -y
        splash 'Chromium Browser is Installed'
        whiptail --title "Chromium" --msgbox "Chromium is Installed on this system." 8 45;
    else
        whiptail --title "Allert!!" --msgbox "Sorry The application can not be installed" 8 45;
    fi
}
#firefox
function firefox()
{
    #New Code 
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S firefox
        splash 'Firefox Browser is Installed'
        whiptail --title "Firefox" --msgbox "Firefox is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo apt-get install firefox-esr -y
        #sudo snap install firefox
        splash 'Firefox Browser is Installed'
        whiptail --title "Firefox" --msgbox "Firefox is Installed on this system." 8 45;
    else
        whiptail --title "Allert!!" --msgbox "Sorry The application can not be installed" 8 45;
    fi

}
#brave
function brave()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S brave-bin --noconfirm --needed
        splash 'Brave Browser is Installed'
        whiptail --title "Brave" --msgbox "Brave is Installed on this system." 8 45;      
    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo apt install brave-browser -y
        # sudo snap install brave
        splash 'Brave Browser is Installed'
        whiptail --title "Brave" --msgbox "Brave is Installed on this system." 8 45;
    else
        whiptail --title "Allert!!" --msgbox "Sorry The application can not be installed" 8 45;
    fi
}
# Google chrome
function google-chrome()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S google-chrome --noconfirm --needed
        splash 'Google Chrome Browser is Installed'
        whiptail --title "Google Chrome" --msgbox "Google Chrome is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo apt install ./google-chrome-stable_current_amd64.deb -y
        splash 'Google Chrome Browser is Installed'
        whiptail --title "Google Chrome" --msgbox "Google Chrome is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application is not Installed" 8 45;
    fi
}
function All_Browser()
{
    chromum
    brave
    google-chrome
    firefox
    whiptail --title "Message" --msgbox "Al Browsers are Installed" 8 45;
}

# TEXT Editior Category

#Atom
function atom()
{
    #New Code

    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S atom
        splash 'Atom Text Editior is Installed'
        whiptail --title "Atom" --msgbox "Atom is Installed on this system." 8 45;                  
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo snap install atom --classic
        splash 'Atom Text Editior is Installed'
        whiptail --title "Atom" --msgbox "Atom is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

# Sublime
function sublime()
{
    #New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S sublime-text --noconfirm --needed
        # sudo flatpak install flathub com.sublimetext.three
        splash 'Sublime Text Editior is Installed'
        whiptail --title "Sublime" --msgbox "Sublime is Installed on this system." 8 45;                  
    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo apt install sublime-text -y 
        #sudo snap install sublime-text --classic
        splash 'Sublime Text Editior is Installed'
        whiptail --title "Sublime" --msgbox "Sublime is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#brackets
function brackets()
{
    #New Code

    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S brackets-bin --noconfirm --needed
        #sudo pamac install brackets-bin 
        splash 'Brackets Text Editior is Installed'
        whiptail --title "Brackets" --msgbox "Brackets is Installed on this system." 8 45;                  
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo flatpak install flathub io.brackets.Brackets -y
        #sudo snap install brackets --classic
        splash 'Brackets Text Editior is Installed'
        whiptail --title "Brackets" --msgbox "Brackets is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

# visual Studio code
function vs_code()
{
    # New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S visual-studio-code-bin --noconfirm --needed
        # sudo pacman -S code
        splash 'Visual Studio Code is Installed'
        whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is Installed." 8 45;        
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install code -y
        #sudo snap install code --classic
        splash 'Visual Stidio Code is Installed'
        whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is Installed." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#notion
function notion()
{
   #New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S notion-app-enhanced --noconfirm --needed
        #sudo pamac install notion-app
        splash 'Notion is Installed'
        whiptail --title "Notion" --msgbox "Notion is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo snap install notion-snap
        splash 'Notion is Installed'
        whiptail --title "Notion" --msgbox "Notion is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

function All-text-Editior() 
{
    sublime
    notion
    vs_code
    brackets
    atom
    whiptail --title "Message" --msgbox "All Text Editior are Installed" 8 45;

}

# MultiMedia Category

#vlc
function vlc()
{
    # New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S vlc --noconfirm --needed
        splash 'VLC Video Players is Installed'
        whiptail --title "VLC Video Player" --msgbox "VLC Video Player is Installed on this system." 8 45;

    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo apt install vlc -y 
        #sudo snap install vlc
        splash 'VLC Video Players is Installed'
        whiptail --title "VLC Video Player" --msgbox "VLC Video Player is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#pluse Audio
function pluseAudio()
{
    #New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S pulseaudio --noconfirm --needed
        splash 'Pluse Audio is Installed'
        whiptail --title "Pluse Audio" --msgbox "Pluse Audio is Installed on this system." 8 45;     
    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo apt install pulseaudio -y
        #sudo snap install pulseaudio
        splash 'Pluse Audio is Installed'
        whiptail --title "Pluse Audio" --msgbox "Pluse Audio is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi

}

#rythmox
function rythmobox()
{
    #New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S rhythmbox-git --noconfirm --needed
        #sudo flatpak install flathub org.gnome.Rhythmbox3
        splash 'Rythmobox Audio is Installed'
        whiptail --title "Rythmobox Audio" --msgbox "Rythmobox Audio is Installed on this system." 8 45;
     
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo flatpak install flathub org.gnome.Rhythmbox3
        splash 'Rythmobox Audio is Installed'
        whiptail --title "Rythmobox" --msgbox "Rythmobox Audio is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}
function All-Multi-Media()
{
    vlc
    pluseAudio
    rythmobox
    whiptail --title "Message" --msgbox "All Multi Media Application are Installed on this system." 8 45;
}

# Development Section

#Android Studio
function android_studio()
{
    #New code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S android-studio --noconfirm --needed
        #sudo flatpak install flathub com.google.AndroidStudio
        splash 'Android Studio is Installed'
        whiptail --title "Android Studio" --msgbox "Android Studio is Installed on this system." 8 45;
                 
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo flatpak install flathub com.google.AndroidStudio
        splash 'Android Studio is Installed'
        whiptail --title "Android Studio" --msgbox "Android Studio is Installed on this system." 8 45;

    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#java JDK
function java_JDK()
{
    #Code is the same and will be include in the new version
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S jre8-openjdk-headless jre8-openjdk jdk8-openjdk  openjdk8-src
        whiptail --title "Java 8 JDK" --msgbox "Java JDK is Installed." 8 45;
        splash 'Java JDK is Installed'
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install default-jre
        sudo apt install openjdk-11-jre-headless
        sudo apt install default-jre
        sudo apt install default-jre
        sudo apt install default-jdk
        whiptail --title "Java JDK" --msgbox "Java JDK is Installed." 8 45;
        splash 'Java JDK is Installed'
       #echo 'system is debian'
    else
        whiptail --title "Error" --msgbox "Application can not be installed." 8 45;
    fi
}

# Netbean
function netbean()
{
    # New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S netbeans --noconfirm --needed
        splash 'Neabean is Installed'
        whiptail --title "Netbeans" --msgbox "Netbeans is Installed on this system." 8 45;   
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo ln -s /var/lib/snapd/snap /snap
        sudo snap install netbeans --classic
        splash 'Neabean is Installed'
        whiptail --title "Netbeans" --msgbox "Netbeans is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi    
}

#Eclipse
function eclipse()
{
    # New code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S eclipse-java  --noconfirm --needed
        splash 'Eclipse is Installed'
        whiptail --title "Eclipse" --msgbox "Eclipse is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo snap install eclipse --classic
        splash 'Eclipse is Installed'
        whiptail --title "Eclipse" --msgbox "Eclipse is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}


#GithHub Desktop
function github_desktop()
{
    #New code

    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S github-desktop-bin --noconfirm --needed
        #sudo flatpak install flathub io.github.shiftey.Desktop
        splash 'GitHub Desktop is Installed'
        whiptail --title "GitHub Desktop" --msgbox "GitHub Desktop is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then
        wget https://github.com/shiftkey/desktop/releases/download/release-2.9.3-linux3/GitHubDesktop-linux-2.9.3-linux3.deb
        sudo apt install gdebi-core -y
        sudo gdebi GitHubDesktop-linux-2.9.3-linux3.deb
        # sudo flatpak install flathub io.github.shiftey.Desktop
        splash 'GitHub Desktop is Installed'
        whiptail --title "GitHub Desktop" --msgbox "GitHub Desktop is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#pychar
function pycharm()
{
    # New code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S pycharm-community-edition --noconfirm --needed    
        splash 'Pycharm is Installed'
        whiptail --title "Pycharm" --msgbox "Pycharm is Installed on this system." 8 45;     
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo snap install pycharm-community --classic
        splash 'Pycharm is Installed'
        whiptail --title "Pycharm" --msgbox "Pycharm is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#Flutter
function flutter()
{
    # New code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S flutter --noconfirm --needed
        #sudo pamac install flutter
        splash 'Flutter is Installed'
        whiptail --title "Flutter" --msgbox "Pycharm is Installed on this system." 8 45;
                 
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo snap install flutter --classic
        splash 'Flutter is Installed'
        whiptail --title "Flutter" --msgbox "Pycharm is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#Powershell
function powershell()
{
    #New Code 
    if [[ "$package_manager" == "pacman" ]];
    then
        paru -S powershell-bin --noconfirm --needed
        #sudo pamac install powershell-bin 
        splash 'Power Shell is Installed'
        whiptail --title "Power Shell" --msgbox "Power Shell is Installed on this system." 8 45;     
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
        # Install PowerShell
        sudo apt-get install -y powershell 
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

# python3
function python()
{
    #this will be the same and will be included in the new Version 
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S python --noconfirm --needed
        splash 'Python 3 is Installed'
        whiptail --title "Python" --msgbox "Python is Installed on this system." 8 45;
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo apt install python3-pip -y
        splash 'Python 3 is Installed'
        whiptail --title "Python" --msgbox "Python is Installed on this system." 8 45;
       #echo 'system is debian'
    else
        whiptail --title "Error" --msgbox "Python is not installed on your System" 8 45;
    fi
}

function All-Devloper()
{
    python
    android_studio
    powershell
    flutter
    pycharm
    github_desktop
    eclipse
    netbean
    java_JDK
    whiptail --title "Message" --msgbox "All Applications are Installed" 8 45;
}

# Office Suite Category
function All-Office()
{
    only_office
    WPS
    libreoffice
    whiptail --title "Message" --msgbox "All Applications are Installed" 8 45;

}


#Only Office
function only_office()
{
    #New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S onlyoffice-bin --noconfirm --needed
        #sudo pacman -S onlyoffice
        splash 'Only Office Suite is Installed'
        whiptail --title "Only Office Suite" --msgbox "Only Office Suite is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
        sudo dpkg -i onlyoffice-desktopeditors_amd64.deb -y
        #sudo snap install onlyoffice-desktopeditors
        splash 'Only Office Suite is Installed'
        whiptail --title "Only Office Suite" --msgbox "Only Office Suite is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

# Libre Office
function libreoffice()
{
    # New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S libreoffice-fresh --noconfirm --needed
        splash 'Libre Office is Installed'
        whiptail --title "Libre Office" --msgbox "Libre Office is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install libreoffice -y
        splash 'Libre Office is Installed'
        whiptail --title "Libre Office" --msgbox "Libre Office is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#WPS Suite
function WPS()
{
    # New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        paru -S wps-office --noconfirm --needed
        #sudo pamac install wps-office
        splash 'WPS Office is Installed'
        whiptail --title "WPS Office" --msgbox "WPS Office is Installed on this system." 8 45;             
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        wget https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10702/wps-office_11.1.0.10702.XA_amd64.deb
        sudo dpkg -i wps-office_11.1.0.10702.XA_amd64.deb -y
        #sudo snap install wps-2019-snap
        splash 'WPS Office is Installed'
        whiptail --title "WPS Office" --msgbox "WPS Office is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi

}

# Conference Call Category


#discord
function All-conference()
{
    discord
    ms_teams
    zoom
    signal-desktop
    telegram-desktop
    whatsApp
    whiptail --title "Message" --msgbox "All Applications are Installed" 8 45;
}
function whatsApp()
{
    #New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        #The command of Arch is decided
        paru -S whatsapp-for-linux --noconfirm --needed
        #sudo pamac install whatsapp-for-linux
        splash 'WhatsApp is Installed'
        whiptail --title "WhatsApp" --msgbox "WhatsApp is Installed." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo snap install whatsapp-for-linux
        splash 'WhatsApp is Installed'
        whiptail --title "WhatsApp" --msgbox "WhatsApp is Installed." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
    
    
}
function discord()
{
    #New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S discord --noconfirm --needed
        splash 'Discord is Installed'
        whiptail --title "Discord" --msgbox "Discord is Installed." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo snap install discord
        splash 'Discord is Installed'
        whiptail --title "Discord" --msgbox "Discord is Installed." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#Microsoft Teams
function ms_teams()
{
    #New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S teams --noconfirm --needed
        #sudo pamac install teams
        splash 'Microsoft Teams is Installed'
        whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is Installed." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then
        wget https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb
        sudo dpkg -i teams_1.3.00.5153_amd64.deb
        #sudo snap install teams
        splash 'Microsft Teams is Installed'
        whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is Installed." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#Zoom
function zoom()
{
    # New Code
    
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S zoom --noconfirm --needed
        splash 'Zoom is Installed'
        whiptail --title "Zoom" --msgbox "Zoom is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then
        wget https://zoom.us/client/latest/zoom_amd64.deb
        sudo apt install ./zoom_amd64.deb -y 
        #sudo snap install zoom-client
        splash 'Zoom is Installed'
        whiptail --title "Zoom" --msgbox "Zoom is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#Signal Desktop
function signal-desktop()
{
    # NEw Code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S signal-desktop --noconfirm --needed
        splash 'Signal Desktop is Installed'
        whiptail --title "Signal Desktop" --msgbox "Signal Desktop is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo apt install signal-desktop -y
        #sudo snap install signal-desktop
        splash 'Signal Desktop is Installed'
        whiptail --title "Signal Desktop" --msgbox "Signal Desktop is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#Telegram Desktop
function telegram-desktop()
{
    # New code

    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S telegram-desktop --noconfirm --needed  
        splash 'Telegram Desktop is Installed'
        whiptail --title "Telegram Desktop" --msgbox "Telegram Desktop is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install telegram-desktop -y
        #sudo snap install telegram-desktop
        splash 'Telegram Desktop is Installed'
        whiptail --title "Telegram Desktop" --msgbox "Telegram Desktop is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}


# Graphic Work Categoty

function All-graphic() 
{
    obs
    kdenlive
    gimp
    blender
    whiptail --title "Message" --msgbox "All Applications are Installed" 8 45;
}
#Obs
function obs()
{
    # New code
  
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S obs-studio --noconfirm --needed
        splash 'OBS is Installed'
        whiptail --title "OBS" --msgbox "OBS is Installed on this system." 8 45;             
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install obs-studio -y
        # sudo snap install obs-studio
        splash 'OBS is Installed'
        whiptail --title "OBS" --msgbox "OBS is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

# KDenlive
function kdenlive()
{
    # New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S kdenlive --noconfirm --needed
        splash 'Kdenlive is Installed'
        whiptail --title "Kdenlive" --msgbox "Kdenlive is Installed on this system." 8 45;             
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo snap install kdenlive
        splash 'Kdenlive is Installed'
        whiptail --title "Kdenlive" --msgbox "Kdenlive is Installed on this system." 8 45;

    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#gimp
function gimp()
{
    # New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S gimp  --noconfirm --needed
        splash 'GIMP is Installed'
        whiptail --title "GIMP" --msgbox "GIMP is Installed on this system." 8 45;             
    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo apt install gimp -y  
        # sudo snap install gimp
        splash 'GIMP is Installed'
        whiptail --title "GIMP" --msgbox "GIMP is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#blender
function blender()
{
    # NEw Code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S blender --noconfirm --needed
        splash 'Blender is Installed'
        whiptail --title "Blender" --msgbox "Blender is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install blender -y
        # sudo snap install blender --classic
        splash 'Blender is Installed'
        whiptail --title "Blender" --msgbox "Blender is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}


# Audio and Music Category

function All-Music()
{
    spotify
    audacity
    plex-media-server
    whiptail --title "Message" --msgbox "All Text Editior are Installed" 8 45;

}
# spotify
function spotify()
{
    # New code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S spotify --noconfirm --needed 
        #sudo flatpak install flathub com.spotify.Client
        splash 'Spotify is Installed'
        whiptail --title "Spotify" --msgbox "Spotify is Installed on this system." 8 45;                
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo flatpak install flathub com.spotify.Client
        splash 'Spotify is Installed'
        whiptail --title "Spotify" --msgbox "Spotify is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

# Audacity
function audacity()
{   
    # New code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S audacity --noconfirm --needed
        splash 'Audacity is Installed'
        whiptail --title "Audacity" --msgbox "Audacity is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install audacity -y
        # sudo snap install audacity
        splash 'Audacity is Installed'
        whiptail --title "Audacity" --msgbox "Audacity is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#Plex Media Server
function plex-media-server()
{
    # New code 
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S plex-media-server --noconfirm --needed
        #sudo pamac install  plex-media-server 
        splash 'Plex Media Server is Installed'
        whiptail --title "Plex Media Server" --msgbox "Plex Media Server is Installed on this system." 8 45;             
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo snap install plexmediaserver
        splash 'Plex Media Server is Installed'
        whiptail --title "Plex Media Server" --msgbox "Plex Media Server is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

# Cloud Service Category
function  All-cloud-services()
{

    if [[ "$package_manager" == "pacman" ]];
    then
        next-cloud
        google--sdk-cloud
        whiptail --title "Message" --msgbox "All Applications are Installed" 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        next-cloud
        google--sdk-cloud
        whiptail --title "Message" --msgbox "All Applications are Installed" 8 45;
    else
        echo 'Importamt compoent is not Installed!!!!'
        exit 0
    fi

    
}
#Next Cloud
function next-cloud()
{
    # New code 
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S nextcloud --noconfirm --needed
        splash 'Next Cloud is Installed'
        whiptail --title "Next Cloud" --msgbox "Next Cloud is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install nextcloud-desktop
        # sudo snap install nextcloud
        splash 'Next Cloud is Installed'
        whiptail --title "Next Cloud" --msgbox "Next Cloud is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

function google--sdk-cloud()
{
    # New code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S google-cloud-sdk --noconfirm --needed
        #sudo pamac install  google-cloud-sdk  
        splash 'Google SDK Cloud is Installed'
        whiptail --title "Google SDK Cloud" --msgbox "Google SDK Cloud is Installed on this system." 8 45;           
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo snap install google-cloud-sdk --classic
        splash 'Google SDK Cloud is Installed'
        whiptail --title "Google SDK Cloud" --msgbox "Google SDK Cloud is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}


# Essencial Category
function All-essencial()
{
    bitwarden
    mailspring
    slack
    stacer
    whiptail --title "Message" --msgbox "All Applications are Installed" 8 45;
}
# bitwarden
function bitwarden()
{
    # New code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S bitwarden --noconfirm --needed
        #sudo pacman -S bitwarden  
        splash 'Bitwarden is Installed'
        whiptail --title "Bitwarden" --msgbox "Bitwarden is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo flatpak install flathub com.bitwarden.desktop -y
        # sudo snap install bitwarden
        splash 'Bitwarden is Installed'
        whiptail --title "Bitwarden" --msgbox "Bitwarden is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}

#mail Spring
function mailspring()
{
    #New code 
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S mailspring --noconfirm --needed
        #sudo pamac install mailspring 
        splash 'MailSpring is Installed'
        whiptail --title "MailSpring" --msgbox "MailSpring is Installed on this system." 8 45;        
    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo flatpak install flathub com.getmailspring.Mailspring -y
        # sudo snap install mailspring
        splash 'MailSpring is Installed'
        whiptail --title "MailSpring" --msgbox "MailSpring is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi
}
#slack
function slack()
{
    # New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S slack-desktop --noconfirm --needed
        #sudo flatpak install flathub com.slack.Slack
        splash 'Slack is Installed'
        whiptail --title "Slack" --msgbox "Slack is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo flatpak install flathub com.slack.Slack -y
        # sudo snap install slack --classic
        splash 'Slack is Installed'
        whiptail --title "Slack" --msgbox "Slack is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Application can be Installed on this system" 8 45;
    fi   
}

# stacer
function stacer()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S stacer-bin --noconfirm --needed
        #sudo pamac install  stacer
        splash 'Slack is Installed'
        whiptail --title "Slack" --msgbox "Slack is Installed on this system." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo apt install stacer -y
        splash 'Stacer is Installed'
        whiptail --title "Stacer" --msgbox "Stacer is Installed on this system." 8 45;
    else
        whiptail --title "Error" --msgbox "Stacer can not be installed on your system!!!!" 8 45;
    fi
}


#Game Category
function All-Games()
{
    steam
    wine
}
#steam
function steam()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S steam --noconfirm --needed
        splash 'Steam is Installed'
        whiptail --title "Steam" --msgbox "Steam is Installed on this system." 8 45; 
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo flatpak install flathub com.valvesoftware.Steam -y
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
        sudo pacman -S wine --noconfirm --needed
        sudo pacman -S winetricks --noconfirm --needed
        sudo pacman -S wine-mono wine_gecko --noconfirm --needed
        splash 'Wine is Installed'
        whiptail --title "Wine" --msgbox "Wine is Installed on this system." 8 45;
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install --install-recommends winehq-stable -y
        sudo apt install winetricks -y
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


