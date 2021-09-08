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

# this is very all of the package manager are placed
declare -A osInfo;
osInfo[/etc/debian_version]="apt-get"
osInfo[/etc/alpine-release]="apk"
osInfo[/etc/centos-release]="yum"
osInfo[/etc/fedora-release]="dnf"
osInfo[/etc/arch-release]="pacman"

#to check the root access
#application will not run without root access
function check_root()
{
    #this will check for root
    ROOT_UID=0
    if [[ ! "${UID}" -eq "${ROOT_UID}" ]]; then
        # Error message 
        whiptail --msgbox --title "ALert!!" "Run me as root, Try sudo ./startup.sh" 20 78;
       # echo_error 'Run me as root.';
       # echo_info 'try sudo ./install.sh';
        exit 1
    fi
}
#this function will check and will install the two necessary packages curl and git once installed it will run start the application.
function install_important_compoent()
{
    splash 'Welcome To Application Installer for Linux
    Name: Mohammad Abdul Rafay 
    Email: 99marafay@gmail.com'
    echo ''
    #this will check for the root access
    check_root

    splash 'Checking for Important Compoent in the system'
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
    sudo apt-get update
    sudo apt-get install git
}
function install_curl_debian_system()
{
    sudo apt-get update
    sudo apt-get install curl
}
function install_git_arch()
{
   FILE=/bin
    if [ ! -f "$FILE" ]; 
    then
        sudo pacman -S git
    fi
}
function install_curl_arch()
{
    FILE=/usr/bin/curl-config
    if [ ! -f "$FILE" ]; 
    then
        sudo pacman -Sy curl       
    fi  
}
function give_permission()
{
    # Giving the executable permission
    chmod +x check_Internet.sh
    chmod +x Terminal_application.sh
    chmod +x Terminal_application_Menu_For_Arch.sh
    chmod +x controller_Menu.sh
    chmod +x GUI_Application.sh
    chmod +x GUI_Meun.sh
    chmod +x choose_Distro.sh
}
function remove_Permisiion()
{
    # removing Permission
    chmod -x check_Internet.sh
    chmod -x Terminal_application.sh
    chmod -x Terminal_application_Menu_For_Arch.sh
    chmod -x controller_Menu.sh
    chmod -x GUI_Application.sh
    chmod -x GUI_Meun.sh
    chmod -x choose_Distro.sh
}
#this is the starting point of the application
function startup()
{
    #this will check for root access if root is not present then it will ext the application
    check_root

    #this will call a function and will provide all of the required permission
    give_permission

    # calling the check internet Script
    . check_Internet.sh

    splash 'Checking for the Internet Connection'
    echo ''
    # once the script is loaded then calling the function
    check_Internet
}
# This will check for all of the important compoents required once checked and installed it will start the application
install_important_compoent