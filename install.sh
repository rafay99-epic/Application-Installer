#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */

#Location for Paru
PARU=/usr/bin/paru
#Location for the yay on the arch system
YAY_LOCATION=/usr/bin/yay

function install-paru-manager()
{
    . check-manager.sh
    
    if [[ "$package_manager" == "pacman" ]];
    then
        if [ ! -e "$PARU" ]; 
        then
            # Installing Paru 
            echo "Installing paru for Arch Linux"
            git clone https://aur.archlinux.org/paru.git
            cd paru
            makepkg -si
            cd ../
        else
            echo "Paru Aur Helper is in the system"
        fi
        
        if [ ! -e "$YAY_LOCATION" ]; 
        then
            paru -S yay --noconfirm --needed
        else
            echo "Yay Aur Helper is in the system"
        fi
        
    fi
}

function give-one-permission()
{
    chmod +x startup.sh
    chmod +x check-manager.sh

}
#to check the root access
#application will not run without root access
# function check_root()
# {
#     #this will check for root
#     ROOT_UID=0
#     if [[ ! "${UID}" -eq "${ROOT_UID}" ]]; then
#         # Error message 
#         whiptail --msgbox --title "ALert!!" "Run me as root, Try sudo ./install.sh" 20 78;
#         exit 1
#     fi
# }

function non-root() 
{
    if [ "$USER" = root ]; then
        echo -ne "
-------------------------------------------------------------------------
          This script shouldn't be run as root. ☹️🙁

          Run script like this:-  ./install.sh
-------------------------------------------------------------------------
"
        exit 1
    fi
}

function remove-start-permission()
{
    chmod -x startup.sh
    chmod -x check-manager.sh
}

function run()
{   
    # Checking non-root 
    non-root
    # Giving Permissions
    give-one-permission
    # Intalling paru for arch system
    install-paru-manager
    # Running the file
    sudo ./startup.sh
    # Removing the File
    remove-start-permission
}
run