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
#this will check if the file is run as root or not
function check_root()
{
    #this will check for root
    ROOT_UID=0
    if [[ ! "${UID}" -eq "${ROOT_UID}" ]]; then
        # Error message 
        whiptail --msgbox --title "ALert!!" "Run me as root, Try sudo./Application_Installer.sh" 20 78;
       # echo_error 'Run me as root.';
       # echo_info 'try sudo ./install.sh';
        exit 1
    fi
}

#the functio is the core main
#first you have to choice your disto Arch or debianed
#for both operating system there are different set of Application and Functions
function choice_Menu()
{
    check_root
    while :; do
        ADVSEL=$(whiptail --title "Application Installer" --fb --menu "Choose an option" --cancel-button "${textexit}Cancel" 25 60 15 \
                "1" "Choose Arch Linux System" \
                "2" "Choose Debian Linux System"  3>&1 1>&2 2>&3)
            case $ADVSEL in
                1)
                    if (whiptail --title "Alert!!" --yesno "Are you sure your system is Arch Linux?." 10 60) 
                    then
                        . Arch_System.sh
                        Arch_System
                        #Arch_System
                    else
                        whiptail --title "Alert!!" --msgbox "Choose Again!!!" 8 45;
                        choice_Menu
                    fi
                ;;
                2)
                    if (whiptail --title "Alert!!" --yesno "Are you sure your system is Debian Linux?." 10 60) 
                    then
                        . Debian_System.sh
                        Debian_system
                        #Debian_system
                    else
                        whiptail --title "Alert!!" --msgbox "Choose Again!!!" 8 45;
                        . choice_Menu.sh
                        choice_Menu 
                    fi
        esac
        textexit="Yes"
        if (textexit=="Yes") 
        then
            remove_Permisiion
            exit
        else
            . choice_Menu.sh 
            choice_Menu
         fi
    done
}

