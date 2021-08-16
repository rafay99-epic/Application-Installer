#!/bin/bash

#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */

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
#this will check if the file is run as root or not
function check_root()
{
    #this will check for root
    ROOT_UID=0
    if [[ ! "${UID}" -eq "${ROOT_UID}" ]]; then
        # Error message 
        whiptail --msgbox --title "ALert!!" "Run me as root, Try sudo./Application_Installer.sh" 20 78;
       # echo_error 'Run me as root.';
       # echo_info 'try sudo ./install.sh';
        exit 1
    fi
}
#this will install snap store and Flatpak store 
function install_store()
{
    #this commad will install snap store on this system
    sudo pacman -S snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
    #this will download flatpak on the system
    sudo pacman -S flatpak
}
#this will install wine 
function install_wine()
{
    #this will install wine for enterprise
    sudo pacman -S wine winetricks wine-mono wine_gecko
    sudo pacman -S wine-staging

}
#this will install java JDK
function install_java()
{
     #this logic is that the file will check for the directory or look for the snap store if
    #the store is not installed then it will install then once install the application will be installed
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        #this will install jdk 8
        sudo pacman -S jre8-openjdk-headless jre8-openjdk jdk8-openjdk openjdk8-doc openjdk8-src
        whiptail --title "Java JDK" --msgbox "Java JDK is Installed." 8 45;
    else 
        install_store
        sudo pacman -S jre8-openjdk-headless jre8-openjdk jdk8-openjdk openjdk8-doc openjdk8-src
        whiptail --title "Java JDK" --msgbox "Java JDK is Installed." 8 45;
    fi
}
#this will install netbeans
function install_netbean()
{
    #this logic is that the file will check for the directory or look for the snap store if
    #the store is not installed then it will install then once install the application will be installed
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        #this wil install nertbeans
        sudo snap install netbeans --classic
        #if the netbeans is installed then it will show this message
        whiptail --title "Netbeans" --msgbox "Netbeans is Installed on this system." 8 45;
    else 
        #this will install store if the system does not have snap store or Flatpak store
        install_store
        #this will install netbeans from the netbeans
        sudo snap install netbeans --classic
        #if it is secussfull then it will display this Message
        whiptail --title "Netbeans" --msgbox "Netbeans is Installed on this system." 8 45;
    fi
}
#this will install spotify
function install_spotify()
{
    #this logic is that the file will check for the directory or look for the snap store if
    #the store is not installed then it will install then once install the application will be installed
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        
        sudo snap install spotify
        whiptail --title "Spotify" --msgbox "spotify is Installed on this system." 8 45;
    else 
        #this will install store 
        install_store
        #this will install netbeans from the netbeans
        sudo snap install spotify
        whiptail --title "Spotify" --msgbox "Spotify is Installed on this system." 8 45;
    fi
}
#this will install android studio
function install_Android_Studio()
{
    #this logic is that the file will check for the directory or look for the snap store if
    #the store is not installed then it will install then once install the application will be installed
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install android-studio --classic
        whiptail --title "Android Studio" --msgbox "Android Studio is Installed on this system." 8 45;
    else 
        #this will install store 
        install_store
        #this will install netbeans from the netbeans
        sudo snap install android-studio --classic
        whiptail --title "Android Studio" --msgbox "Android Studio is Installed on this system." 8 45;
    fi
}
#this will install arch linux system
function system_update_Arch()
{
     # phases=
   # ( 
    #    sudo pacman -Syyu
    #)   
   # for i in $(seq 1 100); 
   # do  
     #   sleep 0.1

       # if [ $i -eq 100 ]; then
       #     echo -e "XXX\n100\nDone!\nXXX"
      #  elif [ $(($i % 25)) -eq 0 ]; 
      #  then
       #     let "phase = $i / 25"
      #      echo -e "XXX\n$i\n${phases[phase]}\nXXX"
      #  else
      #      echo $i
       # fi 
  #  done | whiptail --title 'Updating System' --gauge "${phases[0]}" 6 60 0

    #this will update an arch syste using the terminal
    sudo pacman -Syyu
}
#this will isntall debained system
function system_update_debian()
{
    #this will update and upgrade all of the bebained system
    sudo apt-get update
    sudo apt-get upgrade
    whiptail --title "Debian System" --msgbox "Your System is Updated." 8 45;
}
#this will install enterprise from download function
function install_Enterprise()
{
    #this will instal enterprise
    cd Downloads
    wine start Setup.msi
}

#this will install visual studio code
function install_visualCode()
{
    #this logic is that the file will check for the directory or look for the snap store if
    #the store is not installed then it will install then once install the application will be installed
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install code --classic
        whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is Installed on this system." 8 45;
    else 
        #this will install store 
        install_store
        #this will install code 
        sudo snap install code --classic
        whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is Installed on this system." 8 45;
    fi
}
#this will install discord
function install_discord()
{
     #this logic is that the file will check for the directory or look for the snap store if
    #the store is not installed then it will install then once install the application will be installed
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install discord
        whiptail --title "Discord" --msgbox "Discord is Installed on this system." 8 45;
    else 
        #this will install store 
        install_store
        #this will install discord 
        sudo snap install discord
        whiptail --title "Discord" --msgbox "Discord is Installed on this system." 8 45;
    fi
}
#this will install discord
function install_teams()
{
    #this logic is that the file will check for the directory or look for the snap store if
    #the store is not installed then it will install then once install the application will be installed
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install teams
        whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is Installed on this system." 8 45;
    else 
        #this will install store 
        install_store
        #this will install discord 
        sudo snap install teams
        whiptail --title "Miscrosoft Teams" --msgbox "Microsoft Teams is Installed on this system." 8 45;
    fi
}
#this will instal only offfice suite
function install_oly_office()
{
    #this logic is that the file will check for the directory or look for the snap store if
    #the store is not installed then it will install then once install the application will be installed
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install onlyoffice-desktopeditors
        whiptail --title "Only Office Suite" --msgbox "Only Office Suite is Installed on this system." 8 45;
    else 
        #this will install store 
        install_store
        #this will install discord 
        sudo snap install onlyoffice-desktopeditors
        whiptail --title "Only Office Suite" --msgbox "Only Office Suite is Installed on this system." 8 45;
    fi
}
#this will install notion 
function install_notion()
{
    #this logic is that the file will check for the directory or look for the snap store if
    #the store is not installed then it will install then once install the application will be installed
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install notion-snap
        whiptail --title "Notion" --msgbox "Notion is Installed on this system." 8 45;
    else 
        #this will install store 
        install_store
        #this will install notion 
        sudo snap install notion-snap
        whiptail --title "Notion" --msgbox "Notion is Installed on this system." 8 45;
    fi
}
#this will install bitwarden
function install_bitwarden()
{
    #this logic is that the file will check for the directory or look for the snap store if
    #the store is not installed then it will install then once install the application will be installed
    FILE=/var/lib/snapd/snaps
    if [ -e "$FILE" ]; 
    then
        sudo snap install bitwarden
        whiptail --title "Bitwarden" --msgbox "Bitwarden is Installed on this system." 8 45;
    else 
        #this will install store 
        install_store
        #this will install bitwarden 
        sudo snap install bitwarden
        whiptail --title "Bitwarden" --msgbox "Bitwarden is Installed on this system." 8 45;
    fi
}
function All_Application()
{
    install_java
    install_netbean
    install_spotify
    install_Android_Studio
    install_wine
    install_Enterprise
    install_visualCode
    install_discord
    install_teams
    install_oly_office
    install_notion
    install_bitwarden
    whiptail --title "All Applications" --msgbox "All Application are Installed Installed." 8 45;
}
function Arch_System
{
    txtback = "Yes";
    while :; do
        ADVSEL=$(whiptail --title "Application Installer for Arch System" --fb --menu "Choose an option" --cancel-button "${txtback}Back" 25 60 15 \
            "1" "Update Arch system" \
            "2" "Install Java JDK" \
            "3" "Install Netbeans" \
            "4" "Install Spotify" \
            "5" "Install Android Studio" \
            "6" "Install Wine" \
            "7" "Install Enterprise" \
            "8" "Install Visual Studio Code" \
            "9" "Install Discord" \
            "10" "Install Microsoft Teams" \
            "11" "Install Only Office" \
            "12" "Install Notion" \
            "13" "Install Bitwarden" \
            "14" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to update your System?." 10 60) 
                then
                    system_update_Arch
                    whiptail --title "Arch system" --msgbox "Your System is Updated." 8 45;
                else
                    whiptail --title "Arch System" --msgbox "Ypur System is not Updated!" 8 45;
                fi
                ;;
            2)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Java JDK?." 10 60) 
                then
                    install_java
                else
                    whiptail --title "Java JDK" --msgbox "Java JDK is not Installed" 8 45;
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Netbean?." 10 60) 
                then
                    install_netbean
                else
                    whiptail --title "Netbeans" --msgbox "netbeans is not Installed" 8 45;
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Spotify?." 10 60) 
                then
                    install_spotify
                else
                    whiptail --title "Spotify" --msgbox "Spotify is not Installed" 8 45;
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Android Studio?." 10 60) 
                then
                    install_Android_Studio
                else
                    whiptail --title "Android Studio" --msgbox "Android Studio is not Installed" 8 45;
                fi
                ;;
            6)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Wine?." 10 60) 
                then
                    install_wine
                else
                    whiptail --title "Wine" --msgbox "Wine is not Installed" 8 45;
                fi
                ;;
            7)
                if (whiptail --title "Alert!!" --yesno "Do you want to Enterprise?." 10 60) 
                then
                    install_Enterprise
                else
                    whiptail --title "Enterprise" --msgbox "Enterprise is not Installed" 8 45;
                fi
                ;;
            8)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Visual Studio Code?." 10 60) 
                then
                    install_visualCode
                else
                    whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is not Installed" 8 45;
                fi
                ;;
            9)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Discord?." 10 60) 
                then
                    install_discord
                else
                    whiptail --title "Discord" --msgbox "Discord is not Installed" 8 45;
                fi
                ;;
            10)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Microsoft Teams?." 10 60) 
                then
                    install_teams
                else
                    whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is not Installed" 8 45;
                fi
                ;;
            11)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Only Office Suite?." 10 60) 
                then
                    install_oly_office
                else
                    whiptail --title "Only office Suite" --msgbox "Only Office Suite is not Installed" 8 45;
                fi
                ;;
            12)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Notion?." 10 60) 
                then
                    install_notion
                else
                    whiptail --title "Notion" --msgbox "Notion is not Installed" 8 45;   
                fi
                ;;
            13)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Bitwarden?." 10 60) 
                then
                    install_bitwarden
                else
                    whiptail --title "Bitwarden" --msgbox "Bitwarden is not Installed" 8 45;   
                fi
                ;;
            14)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All_Application
                else
                    whiptail --title "All Applications" --msgbox "No Application are Installed" 8 45;   
                fi
        esac
        if(txtback=="Yes")
        then
            choice_Menu
        fi
        echo "Do u want to continue ?"
        read i
        if [ $i != "yes" ]
        then
            exit
        fi
    done 
    
}
function Debian_system()
{
    txtback = "Yes"
    while :; do
        ADVSEL=$(whiptail --title "Application Installer for Debianed System" --fb --menu "Choose an option" --cancel-button "${txtback}Back" 25 60 15 \
            "1" "Update Debian system" \
            "2" "Install Java JDK" \
            "3" "Install Netbeans" \
            "4" "Install Spotify" \
            "5" "Install Android Studio" \
            "6" "Install Wine" \
            "7" "Install Enterprise" \
            "8" "Install Visual Studio Code" \
            "9" "Install Discord" \
            "10" "Install Microsoft Teams" \
            "11" "Install Only Office" \
            "12" "Install Notion" \
            "13" "Install Bitwarden" \
            "14" "Install All Application Listed above" 3>&1 1>&2 2>&3)
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
                    install_java
                else
                    whiptail --title "Java JDK" --msgbox "Java JDK is not Installed" 8 45;
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Netbean?." 10 60) 
                then
                    install_netbean
                else
                    whiptail --title "Netbeans" --msgbox "netbeans is not Installed" 8 45;
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Spotify?." 10 60) 
                then
                    install_spotify
                else
                    whiptail --title "Spotify" --msgbox "Spotify is not Installed" 8 45;
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Android Studio?." 10 60) 
                then
                    install_Android_Studio
                else
                    whiptail --title "Android Studio" --msgbox "Android Studio is not Installed" 8 45;
                fi
                ;;
            6)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Wine?." 10 60) 
                then
                    install_wine
                else
                    whiptail --title "Wine" --msgbox "Wine is not Installed" 8 45;
                fi
                ;;
            7)
                if (whiptail --title "Alert!!" --yesno "Do you want to Enterprise?." 10 60) 
                then
                    install_Enterprise
                else
                    whiptail --title "Enterprise" --msgbox "Enterprise is not Installed" 8 45;
                fi
                ;;
            8)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Visual Studio Code?." 10 60) 
                then
                    install_visualCode
                else
                    whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is not Installed" 8 45;
                fi
                ;;
            9)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Discord?." 10 60) 
                then
                    install_discord
                else
                    whiptail --title "Discord" --msgbox "Discord is not Installed" 8 45;
                fi
                ;;
            10)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Microsoft Teams?." 10 60) 
                then
                    install_teams
                else
                    whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is not Installed" 8 45;
                fi
                ;;
            11)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Only Office Suite?." 10 60) 
                then
                    install_oly_office
                else
                    whiptail --title "Only office Suite" --msgbox "Only Office Suite is not Installed" 8 45;
                fi
                ;;
            12)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Notion?." 10 60) 
                then
                    install_notion
                else
                    whiptail --title "Notion" --msgbox "Notion is not Installed" 8 45;   
                fi
                ;;
            13)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Bitwarden?." 10 60) 
                then
                    install_bitwarden
                else
                    whiptail --title "Bitwarden" --msgbox "Bitwarden is not Installed" 8 45;   
                fi
                ;;
            14)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All_Application
                else
                    whiptail --title "All Applications" --msgbox "No Application are Installed" 8 45;   
                fi
        esac

        if(txtback=="Yes")
        then
            choice_Menu
        fi
        echo "Do u want to continue ?"
        read i
        if [ $i != "yes" ]
        then
            exit
        fi
    done 
}
#GUI and this is the Menu to make thing easy but it is old with no confirming message
function advancedMenu() 
{
    splash 'Abdul Rafay Application'
    check_root
    echo 
    echo
    while :; do
        ADVSEL=$(whiptail --title "Application Installer" --fb --menu "Choose an option" 25 60 15 \
            "1" "Update Arch system" \
            "2" "Update Debained System" \
            "3" "Install Snap Package and Flathub package" \
            "4" "Install Java JDK" \
            "5" "Install Netbeans" \
            "6" "Install Spotify" \
            "7" "Install Android Studio" \
            "8" "Install Wine" \
            "9" "Install Enterprise" \
            "10" "Install Visual Studio Code" \
            "11" "Install Discord" \
            "12" "Install Microsoft Teams" \
            "13" "Install Only Office" \
            "14" "Install Notion" \
            "15" "Install Bitwarden" \
            "16" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to update your System?." 10 60) 
                then
                    system_update_Arch
                    whiptail --title "Arch system" --msgbox "Your System is Updated." 8 45;
                else
                    whiptail --title "Arch System" --msgbox "Ypur System is not Updated!" 8 45;
                fi
                ;;
            2)
            if (whiptail --title "Alert!!" --yesno "Do you want to Update your System?." 10 60) 
                then
                    system_update_debian
                    whiptail --title "Debian System" --msgbox "System is Updated" 8 45;
                else
                    whiptail --title "Drbian System" --msgbox "System is not Installed" 8 45;
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Snap & Flathub Package Manager?." 10 60) 
                then
                    install_store
                    whiptail --title "Snap & Flathub Package Manager" --msgbox "Snap & Flathub Package Manager is Installed." 8 45;
                else
                    whiptail --title "Snap & Flathub Package Manager" --msgbox "Snap & Flathub Package Manager are not Installed" 8 45;
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Java JDK?." 10 60) 
                then
                    install_java
                    whiptail --title "Java JDK" --msgbox "Java JDK is Installed." 8 45;
                else
                    whiptail --title "Java JDK" --msgbox "Java JDK is not Installed" 8 45;
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Netbean?." 10 60) 
                then
                    install_netbean
                    whiptail --title "Netbeans" --msgbox "Netbeans is Installed." 8 45;
                else
                    whiptail --title "Netbeans" --msgbox "netbeans is not Installed" 8 45;
                fi
                ;;
            6)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Spotify?." 10 60) 
                then
                    install_spotify
                    whiptail --title "Spotify" --msgbox "Spotify is Installed." 8 45;
                else
                    whiptail --title "Spotify" --msgbox "Spotify is not Installed" 8 45;
                fi
                ;;
            7)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Android Studio?." 10 60) 
                then
                    install_Android_Studio
                    whiptail --title "Android Studio" --msgbox "Android Studio is Installed." 8 45;
                else
                    whiptail --title "Android Studio" --msgbox "Android Studio is not Installed" 8 45;
                fi
                ;;
            8)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Wine?." 10 60) 
                then
                    install_wine
                    whiptail --title "Wine" --msgbox "Wine is Installed." 8 45;
                else
                    whiptail --title "Wine" --msgbox "Wine is not Installed" 8 45;
                fi
                ;;
            9)
                if (whiptail --title "Alert!!" --yesno "Do you want to Enterprise?." 10 60) 
                then
                    install_Enterprise
                    whiptail --title "Enterprise" --msgbox "Enterprise is Installed." 8 45;
                else
                    whiptail --title "Enterprise" --msgbox "Enterprise is not Installed" 8 45;
                fi
                ;;
            10)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Visual Studio Code?." 10 60) 
                then
                    install_visualCode
                    whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is Installed." 8 45;
                else
                    whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is not Installed" 8 45;
                fi
                ;;
            11)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Discord?." 10 60) 
                then
                    install_discord
                    whiptail --title "Discord" --msgbox "Discord is Installed." 8 45;
                else
                    whiptail --title "Discord" --msgbox "Discord is not Installed" 8 45;
                fi
                ;;
            12)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Microsoft Teams?." 10 60) 
                then
                    install_teams
                    whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is Installed." 8 45;
                else
                    whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is not Installed" 8 45;
                fi
                ;;
            13)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Only Office Suite?." 10 60) 
                then
                    install_oly_office
                    whiptail --title "Only Office Suite" --msgbox "Only Office Suite is Installed." 8 45;
                else
                    whiptail --title "Only office Suite" --msgbox "Only Office Suite is not Installed" 8 45;
                fi
                ;;
            14)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Notion?." 10 60) 
                then
                    install_notion
                    whiptail --title "Notion" --msgbox "Notion is Installed." 8 45;
                else
                    whiptail --title "Notion" --msgbox "Notion is not Installed" 8 45;   
                fi
                ;;
            15)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Bitwarden?." 10 60) 
                then
                    install_bitwarden
                    whiptail --title "Bitwarden" --msgbox "Bitwarden is Installed." 8 45;
                else
                    whiptail --title "Bitwarden" --msgbox "Bitwarden is not Installed" 8 45;   
                fi
                ;;
            16)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All_Application
                    whiptail --title "All Applications" --msgbox "All Application are Installed Installed." 8 45;
                else
                    whiptail --title "All Applications" --msgbox "No Application are Installed" 8 45;   
                fi
        esac
        echo "Do u want to continue ?"
        read i
        if [ $i != "yes" ]
        then
            exit
        fi
    done 
    

}
#the functio is the core main
#first you have to choice your disto Arch or debianed
#for both operating system there are different set of Application and Functions
function choice_Menu()
{
    
    check_root
    echo 
    echo
    while :; do
        ADVSEL=$(whiptail --title "Application Installer" --fb --menu "Choose an option" --cancel-button "${textexit}Cancel" 25 60 15 \
                "1" "Choose Arch Linux System" \
                "2" "Choose Debian Linux System"  3>&1 1>&2 2>&3)
            case $ADVSEL in
                1)
                    if (whiptail --title "Alert!!" --yesno "Are you sure your system is Arch Linux?." 10 60) 
                    then
                        Arch_System
                    else
                        whiptail --title "Alert!!" --msgbox "Choose Again!!!" 8 45;
                        choice_Menu
                    fi
                ;;
                2)
                    if (whiptail --title "Alert!!" --yesno "Are you sure your system is Debian Linux?." 10 60) 
                    then
                        Debian_system
                    else
                        whiptail --title "Alert!!" --msgbox "Choose Again!!!" 8 45;
                        choice_Menu 
                    fi
        esac
        textexit="Yes"
        if (textexit=="Yes") 
        then
             exit
        else
            choice_Menu
         fi
    done
}
#this is the main function
function main()
{
    clear
    #this is the logo for my aplication
    splash 'Abdul Rafay Application Installer'
    #this will check as a root if not then it will suggest to run this script as a root
    check_root   
    echo 
    echo
    i="yes"
    while [ $i = "yes" ]
    do
        echo "1.Update Arch System"
        echo "2.Update Debian based System"
        echo "3.Install Store"
        echo "4.Install Java JDK"
        echo "5.Install Java Netbean"
        echo "6.Install spotify"
        echo "7.Install Android Studio"
        echo "8.Install wine"
        echo "9.Install Enterprise"
        echo "10.Install Visual Studio Code"
        echo "11.Install Discord"
        echo "12.Install Microsoft Teams"
        echo "13.Install Only OFiice Suite"
        echo "14.Install Notion"
        echo "15.Install Bitwarden"
        echo "Enter your choice"
    read ch
    case $ch in
        1)  system_update_Arch
            splash 'Your System is updated' ;;
        2) system_update_debian
            splash 'Your System is updated' ;;
        3) install_store
            splash 'Snap Store & Flatpak is Installed' ;;
        4) install_java
            splash 'Java JDK is installed' ;;
        5) install_netbean
            splash 'Netbean is Installed' ;;
        6)  install_spotify
            splash 'Spotify is Installed' ;;
        7)  install_Android_Studio
            splash 'Android Studio is Installed' ;;
        8) install_wine
            splash 'Wine is Installed' ;;
        9) install_Enterprise
            splash 'Enterprise is Installed' ;;
        10) install_visualCode
            splash 'Code is Installed' ;;
        11) install_discord
            splash 'Discord is Installed' ;;
        12) install_teams
            splash 'Microsoft Teams are Installed' ;;
        13) install_oly_office
            splash 'Only Office Suite is Installed' ;; 
        14) install_notion
            splash 'Notion is Installed' ;; 
        15) install_bitwarden
            splash 'Enterprise is Installed' ;; 
        *) echo "Invalid choice";;
    esac
    echo "Do u want to continue ?"
    read i
    if [ $i != "yes" ]
    then
        exit
    fi
    done    
}
#main
#advancedMenu
#Arch_System
#Debian_system
choice_Menu
