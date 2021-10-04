#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */

# this is very all of the package manager are placed
declare -A osInfo;
osInfo[/etc/debian_version]="apt-get"
osInfo[/etc/alpine-release]="apk"
osInfo[/etc/centos-release]="yum"
osInfo[/etc/fedora-release]="dnf"
osInfo[/etc/arch-release]="pacman"

#to find the which Os yo are running
for f in ${!osInfo[@]}
do
    if [[ -f $f ]];
    then
         package_manager=${osInfo[$f]}
    fi
done


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
    splash 'Welcome To Application Installer for Linux
    Name: Mohammad Abdul Rafay 
    Email: 99marafay@gmail.com'
    echo ''
}

function check_OS()
{
    #this will check for root, if root access is not given it will exit the application
    check_root

    if [[ "$package_manager" == "pacman" ]];
    then
        startup
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        startup
    else
        whiptail --title "Error" --msgbox "Your Package Manager is not Supported" 8 45;
        exit 0
    fi
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
   
}
#this is the starting point
check_OS