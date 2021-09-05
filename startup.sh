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

#this function will check and will install the two necessary packages curl and git once installed it will run start the application.
function install_important_compoent()
{
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
        startup
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
    sudo pacman -S git
}
function install_curl_arch()
{
    sudo pacman -Sy curl
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
}
#this is the starting point of the application
function startup()
{
    #this will call a function and will provide all of the required permission
    give_permission

    # calling the check internet Script
    . check_Internet.sh

    # once the script is loaded then calling the function
    check_Internet
}
# This will check for all of the important compoents required once checked and installed it will start the application
install_important_compoent