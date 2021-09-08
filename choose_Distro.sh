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


# this file will check thedistro and then will launch the GUI and CLI Application Installer
# This function will call the controller_Menu
function choose_Distro()
{
    for f in ${!osInfo[@]}
    do
        if [[ -f $f ]];then
         package_manager=${osInfo[$f]}
        fi
    done
       
    if [[ "$package_manager" == "pacman" ]];
    then
        . controller_Menu.sh
        controller_Menu
       #echo 'Working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        . controller_Menu.sh
        controller_Menu
        #echo 'system is debian'
    else
        echo 'System is Not Supported!!'
        exit 0
    fi
}
choose_Distro