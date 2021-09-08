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




function controller_Menu()
{
    while :; do
        ADVSEL=$(whiptail --title "Welcome to Application Installer" --fb --menu "Choose an option" --cancel-button "${textexit} Back" 25 60 15 \
                "1" "Install GUI Application" \
                "2" "Install CLI Application"  3>&1 1>&2 2>&3)
            case $ADVSEL in
                1)
                    if (whiptail --title "Alert!!" --yesno "Are you sure?." 10 60) 
                    then
                        . GUI_Meun.sh        
                        GUI_Menu
                    else
                        whiptail --title "Alert!!" --msgbox "Choose Again!!!" 8 45;
                        controller_Menu
                    fi
                ;;
                2)
                    if (whiptail --title "Alert!!" --yesno "Are you sure?." 10 60) 
                    then
                        . Terminal_application_Menu_For_Arch.sh
                        terminal_application_menu_arch 
                    else
                        whiptail --title "Alert!!" --msgbox "Choose Again!!!" 8 45;
                        controller_Menu
                    fi
                ;;
        esac

        textexit="Yes"
        if (textexit=="Yes") 
        then
            remove_Permisiion
            splash 'BYE!!! Seen you Soon'
            exit 0
         fi
    done
}
controller_Menu