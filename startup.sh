#!/bin/bash

#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */
function give_permission()
{
    # Giving the executable permission
    chmod +x check_Internet.sh
    chmod +x choice_Menu.sh
    chmod +x Arch_System.sh
    chmod +x Debian_System.sh
    
}
function remove_Permisiion()
{
    chmod -x check_Internet.sh
    chmod -x choice_Menu.sh
    chmod -x Arch_System.sh
    chmod -x Debian_System.sh
}
function startup()
{
    #this will call a function and will provide all of the required permission
    give_permission

    # calling the check internet Script
    . check_Internet.sh

    # once the script is loaded then calling the function
    check_Internet
}
# this is the begining of the Application
startup