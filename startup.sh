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

#to check the root access
#application will not run without root access
function check_root()
{
    #this will check for root
    ROOT_UID=0
    if [[ ! "${UID}" -eq "${ROOT_UID}" ]]; then
        # Error message 
        whiptail --msgbox --title "ALert!!" "Run me as root, Try sudo ./startup.sh" 20 78;
       # echo_error 'Run me as root.';
       # echo_info 'try sudo ./install.sh';
        exit 1
    fi
}
#this function will check and will install the two necessary packages curl and git once installed it will run start the application.
function install_important_compoent()
{
    #this will check for the root access
    check_root

    for f in ${!osInfo[@]}
    do
        if [[ -f $f ]];then
         package_manager=${osInfo[$f]}
        fi
    done
       
    if [[ "$package_manager" == "pacman" ]];
    then
        install_git_arch
        install_curl_arch
        #startup
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        install_git_debian_system
        install_curl_debian_system
        startup
        #echo 'system is debian'
    else
        echo 'System is Not Supported!!'
        exit 0
    fi
}
function install_git_debian_system()
{
    sudo apt-get install git
}
function install_curl_debian_system()
{
    sudo apt-get install curl
}
function install_git_arch()
{
   FILE=/bin
    if [ -f "$FILE" ]; 
    then
      #  echo "$FILE is a directory."
        startup
    else
        sudo pacman -S git
        startup
    fi
}
function install_curl_arch()
{
    FILE=/usr/bin/curl-config
    if [ -f "$FILE" ]; then
        echo "$FILE exists."
        startup
    else
        sudo pacman -Sy curl
        startup
    fi  
}
function give_permission()
{
    # Giving the executable permission
    chmod +x check_Internet.sh
    chmod +x choice_Distro.sh
    chmod +x Arch_System.sh
    chmod +x Debian_System.sh
    chmod +x Controller_ChoiceMenu_Arch.sh
    chmod +x Terminal_application.sh
    chmod +x Terminal_application_Menu_For_Arch.sh
    chmod +x Controller_Choice_Menu_Debian_System.sh
    
}
function remove_Permisiion()
{
    # removing Permission
    chmod -x check_Internet.sh
    chmod -x choice_Distro.sh
    chmod -x Arch_System.sh
    chmod -x Debian_System.sh
    chmod -x Controller_ChoiceMenu_Arch.sh
    chmod -x Terminal_application.sh
    chmod -x Terminal_application_Menu_For_Arch.sh
    chmod -x Controller_Choice_Menu_Debian_System.sh
}
#this is the starting point of the application
function startup()
{
    #this will check for root access if root is not present then it will ext the application
    check_root

    #this will call a function and will provide all of the required permission
    give_permission

    # calling the check internet Script
    . check_Internet.sh

    # once the script is loaded then calling the function
    check_Internet
}
# This will check for all of the important compoents required once checked and installed it will start the application
install_important_compoent