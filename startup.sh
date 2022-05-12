#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */

#this will import the splash.sh file
. splash.sh

#this will import the file check which package manager you are running
. check-manager.sh




function give_permission()
{
    # Giving the executable permission
    chmod +x check_Internet.sh
    chmod +x Terminal_application.sh
    chmod +x Terminal-Application-Menu.sh
    chmod +x controller_Menu.sh
    chmod +x GUI_Application.sh
    chmod +x GUI_Meun.sh
    chmod +x choose_Distro.sh
    chmod +x splash.sh
    chmod +x check_Compoents.sh
    chmod +x Browser.sh
    chmod +x  Development-tools.sh
    chmod +x Games-category-menu.sh
    chmod +x MultiMedia-category.sh
    chmod +x cloud-service-category-menu.sh
    chmod +x conference-call-menu.sh
    chmod +x essential-category-menu.sh
    chmod +x  graphical-work-category-menu.sh
    chmod +x music-category-menu.sh
    chmod +x office-category-menu.sh
    chmod +x text-editior-category-meun.sh
    chmod +x check-manager.sh
}
function remove_Permisiion()
{
    # removing Permission
    chmod -x check_Internet.sh
    chmod -x Terminal_application.sh
    chmod -x Terminal-Application-Menu.sh
    chmod -x controller_Menu.sh
    chmod -x GUI_Application.sh
    chmod -x GUI_Meun.sh
    chmod -x choose_Distro.sh
    chmod -x splash.sh
    chmod -x check_Compoents.sh

    chmod -x Browser.sh
    chmod -x  Development-tools.sh
    chmod -x Games-category-menu.sh
    chmod -x MultiMedia-category.sh
    chmod -x cloud-service-category-menu.sh
    chmod -x conference-call-menu.sh
    chmod -x essential-category-menu.sh
    chmod -x graphical-work-category-menu.sh
    chmod -x music-category-menu.sh
    chmod -x office-category-menu.sh
    chmod -x text-editior-category-meun.sh
    chmod -x check-manager.sh
}

function check_Files()
{
   if [[ -f check_Internet.sh && -f GUI_Application.sh && -f GUI_Meun.sh && -f choose_Distro.sh && -f controller_Menu.sh && -f Terminal_application.sh && -f Terminal-Application-Menu.sh && -f check_Compoents.sh && -f splash.sh && -f Browser.sh && -f Development-tools.sh && -f Games-category-menu.sh && -f MultiMedia-category.sh && -f cloud-service-category-menu.sh && -f conference-call-menu.sh && -f essential-category-menu.sh && -f graphical-work-category-menu.sh && -f music-category-menu.sh && -f office-category-menu.sh && -f text-editior-category-meun.sh ]]
   then
        echo ''
        splash 'All Files are Present'
        echo ''
        #echo "All Files Exit"
    else
        splash 'Files are not Present, Download all of the Files!!'
        echo 'Some Files are missing'
        echo 'Download all of the Files!!!'
        exit 1
    fi
}

function startup_message()
{
    splash 'Welcome To Application Installer
    Name: Mohammad Abdul Rafay 
    Email: 99marafay@gmail.com'
    echo ''
}


#this is the starting point of the application
function startup()
{
    startup_message

    #this function will check if all of the files are present or not 
    check_Files

    #this will call a function and will provide all of the required permission
    give_permission
    
    # calling the check internet Script
    splash 'Checking for the Internet Connection'
    echo ''
    . check_Internet.sh
    run_internet
}
startup