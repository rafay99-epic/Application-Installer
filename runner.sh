#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */
function welcome()
{
    echo -ne "
-------------------------------------------------------------------------
        Welcome to Application Installer
-------------------------------------------------------------------------
"
}
function bye()
{
            echo -ne "
-------------------------------------------------------------------------
          All Applications are Installed

          Thank you for using this Application
-------------------------------------------------------------------------
"
}
function non-root() 
{
    if [ "$USER" = root ]; then
        echo -ne "
-------------------------------------------------------------------------
          This script shouldn't be run as root. ☹️🙁

          Run script like this:-  ./runner.sh
-------------------------------------------------------------------------
"
        exit 1
    fi
}
function GivePermissions()
{
    cd checkInternet
    chmod +x internet.sh
    cd ../
    
    cd checkCompoent
    chmod +x compoent.sh
    cd ../

    cd checkOS
    chmod +x OS.sh
    cd ../
}
function RemovePermissions()
{
    cd checkInternet
    chmod -x internet.sh
    cd ../
    
    cd checkCompoent
    chmod -x compoent.sh
    cd ../

    cd checkOS
    chmod -x OS.sh
    cd ../
}
function calling()
{
    cd checkInternet
    ./internet.sh
    cd ../
    
    cd checkCompoent
    sudo ./compoent.sh
    cd ../

    cd checkOS
    ./OS.sh
    cd ../
}
function run()
{
    # welcome Message
    welcome
    # no root privialages
    non-root
    # Giving Permissions
    GivePermissions
    # calling other Methods
    calling
    # Removing Fuinctions
    RemovePermissions
    # bye Message
    bye
}
run
