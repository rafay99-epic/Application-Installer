#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */

 

function give-one-permission()
{
    chmod +x startup.sh

}
#to check the root access
#application will not run without root access
function check_root()
{
    #this will check for root
    ROOT_UID=0
    if [[ ! "${UID}" -eq "${ROOT_UID}" ]]; then
        # Error message 
        whiptail --msgbox --title "ALert!!" "Run me as root, Try sudo ./install.sh" 20 78;
        exit 1
    fi
}



function remove-start-permission()
{
    chmod -x startup.sh
}

function run()
{
    check_root
    give-one-permission
    . startup.sh
    startup

}
run