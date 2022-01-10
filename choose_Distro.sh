#!/bin/bash

#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */


#this will import the file check which package manager you are running
. controller_Menu.sh
. check-manager.sh


# this file will check the distro and then will launch the GUI and CLI Application Installer
# This function will call the controller_Menu
function choose_Distro()
{   
    if [[ "$package_manager" == "pacman" ]];
    then
        controller_Menu
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        controller_Menu
    else
        echo 'System is Not Supported!!'
        exit 0
    fi
}
