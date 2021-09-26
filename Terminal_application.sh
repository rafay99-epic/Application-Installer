#!/bin/bash

#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */
# different function toinstall terminal Bsed Programs 

#This File will contain all of the Application 

declare -A osInfo;
osInfo[/etc/debian_version]="apt-get"
osInfo[/etc/alpine-release]="apk"
osInfo[/etc/centos-release]="yum"
osInfo[/etc/fedora-release]="dnf"
osInfo[/etc/arch-release]="pacman"


#this is the location for the snap store files
#FILE=/var/lib/snapd/snaps

#to find which OS is this 
for f in ${!osInfo[@]}
    do
        if [[ -f $f ]];then
         package_manager=${osInfo[$f]}
        fi
    done

# function install_store()
# {
#     . splash.sh
#     splash 'Install Snap Store'
#     echo ''
#     for f in ${!osInfo[@]}
#     do
#         if [[ -f $f ]];then
#          package_manager=${osInfo[$f]}
#         fi
#     done
       
#     if [[ "$package_manager" == "pacman" ]];
#     then
#          #this commad will install snap store on this system
#         sudo pacman -S snapd
#         sudo systemctl enable --now snapd.socket
#         sudo ln -s /var/lib/snapd/snap /snap
#        # echo 'program is working'
#     elif [[ "$package_manager" == "apt-get" ]];
#     then 
#         sudo apt install snapd
#         sudo snap install snap-store
#     else
#         echo 'System is Not Supported!!'
#         exit 0
#     fi
# }

# gdu is a disk analyzier
function install_gdu()
{
    # New Code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S gdu
        . splash.sh
        splash 'gdu is Installed'
        echo ''
        whiptail --title "GDU Disk Analyizer" --msgbox "GDU Disk Analyizer is Installed." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then         
        sudo  snap install gdu-disk-usage-analyzer
        sudo snap connect gdu-disk-usage-analyzer:mount-observe :mount-observe
        sudo snap connect gdu-disk-usage-analyzer:system-backup :system-backup
        sudo snap alias gdu-disk-usage-analyzer.gdu gdu
        . splash.sh
        splash 'gdu is Installed'
        echo ''
        whiptail --title "GDU Disk Analyizer" --msgbox "GDU Disk Analyizer is Installed." 8 45;
    else
        whiptail --title "Error" --msgbox "Applicatin can not be installed." 8 45;
    fi

    # Old Code

    # if [ -e "$FILE" ]; 
    # then        
    #     sudo  snap install gdu-disk-usage-analyzer
    #     sudo snap connect gdu-disk-usage-analyzer:mount-observe :mount-observe
    #     sudo snap connect gdu-disk-usage-analyzer:system-backup :system-backup
    #     sudo snap alias gdu-disk-usage-analyzer.gdu gdu
    #     . splash.sh
    #     splash 'gdu is Installed'
    #     echo ''
    #     whiptail --title "GDU Disk Analyizer" --msgbox "GDU Disk Analyizer is Installed." 8 45;
    # else 
    #     install_store

    #     sudo  snap install gdu-disk-usage-analyzer
    #     sudo snap connect gdu-disk-usage-analyzer:mount-observe :mount-observe
    #     sudo snap connect gdu-disk-usage-analyzer:system-backup :system-backup
    #     sudo snap alias gdu-disk-usage-analyzer.gdu gdu
    #     . splash.sh
    #     splash 'gdu is Installed'
    #     echo ''
    #     whiptail --title "GDU Disk Analyizer" --msgbox "GDU Disk Analyizer is Installed." 8 45;
    # fi
}

# lsd is alternative to ls
function install_lsd()
{ 
    # NEw code
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S lsd
        . splash.sh
        splash 'lsd is Installed'
        echo ''
        whiptail --title "lsd" --msgbox "lsd is Installed." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo snap install lsd
        . splash.sh
        splash 'lsd is Installed'
        echo ''
        whiptail --title "lsd" --msgbox "lsd is Installed." 8 45;
    else
        whiptail --title "Error" --msgbox "Applicatin can not be installed." 8 45;
    fi

    # Old code from different Version  
    # if [ -e "$FILE" ]; 
    # then
    #     sudo snap install lsd
    #     . splash.sh
    #     splash 'lsd is Installed'
    #     echo ''
    #     whiptail --title "lsd" --msgbox "lsd is Installed." 8 45;
    # else 
    #     install_store
    #     sudo snap install lsd
    #     . splash.sh
    #     splash 'lsd is Installed'
    #     echo ''
    #     whiptail --title "lsd" --msgbox "lsd is Installed." 8 45;
    # fi
}
function install_git()
{      
    if [[ "$package_manager" == "pacman" ]];
    then
       sudo pacman -S git
       . splash.sh
        splash 'git is Installed'
        echo ''
       whiptail --title "Git Clone" --msgbox "Git Clone is Installed." 8 45;
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install git
        . splash.sh
        splash 'git is Installed'
        echo ''
        whiptail --title "Git Clone" --msgbox "Git Clone is Installed." 8 45;
    else
        whiptail --title "Git Clone" --msgbox "Git Clone is not Installed." 8 45;
    fi

    
}    
function install_htop()
{
    #New Code 
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -S htop 
        . splash.sh
        splash 'htop is Installed'
        echo ''
        whiptail --title "htop" --msgbox "htop is Installed." 8 45;
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt-get install htop
        . splash.sh
        splash 'htop is Installed'
        echo ''
        whiptail --title "htop" --msgbox "htop is Installed." 8 45;
    else
        whiptail --title "Error" --msgbox "Applicatin can not be installed." 8 45;
    fi

    # Old Code

    # if [ -e "$FILE" ]; 
    # then
    #     sudo snap install htop
    #     . splash.sh
    #     splash 'htop is Installed'
    #     echo ''
    #     whiptail --title "htop" --msgbox "htop is Installed." 8 45;
    # else 
    #     install_store
    #     sudo snap install htop
    #     . splash.sh
    #     splash 'htop is Installed'
    #     echo ''
    #     whiptail --title "htop" --msgbox "htop is Installed." 8 45;
    # fi
}
function install_neofetch()
{   
    if [[ "$package_manager" == "pacman" ]];
    then
       sudo pacman -S neofetch
       . splash.sh
        splash 'neofetch is Installed'
        echo ''
       whiptail --title "Neofetch" --msgbox "Neofetch is Installed." 8 45;
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt-get update
        sudo apt-get install neofetch
        . splash.sh
        splash 'neofetch is Installed'
        echo ''
        whiptail --title "Neofetch" --msgbox "Neofetch is Installed." 8 45;
    else
        whiptail --title "Neofetch" --msgbox "Neofetch not is Installed." 8 45;
    fi
    
}
function install_PowersaveMode()
{
    # New code
    if [[ "$package_manager" == "pacman" ]];
    then
        yay -S auto-cpufreq-git
        . splash.sh
        splash 'Frequency Changer is Installed'
        echo ''
        whiptail --title "CPU frequence Changer" --msgbox "CPU Frequence Changer is Installed." 8 45;         
    elif [[ "$package_manager" == "apt-get" ]];
    then
        sudo snap install auto-cpufreq
        . splash.sh
        splash 'Frequency Changer is Installed'
        echo ''
        whiptail --title "CPU frequence Changer" --msgbox "CPU Frequence Changer is Installed." 8 45;
    else
        whiptail --title "Error" --msgbox "Applicatin can not be installed." 8 45;
    fi
    
    # Old Code
    # if [ -e "$FILE" ]; 
    # then
    #     sudo snap install auto-cpufreq
    #     . splash.sh
    #     splash 'Frequency Changer is Installed'
    #     echo ''
    #     whiptail --title "CPU frequence Changer" --msgbox "CPU Frequence Changer is Installed." 8 45;
    # else 
    #     install_store
    #     sudo snap install auto-cpufreq
    #     . splash.sh
    #     splash 'Frequency changer is Installed'
    #     echo ''
    #     whiptail --title "CPU frequence Changer" --msgbox "CPU Frequence Changer is Installed." 8 45;
    # fi    
}
function install_Curl()
{     
    if [[ "$package_manager" == "pacman" ]];
    then
        sudo pacman -Sy curl
        . splash.sh
        splash 'curl is Installed'
        echo ''
        whiptail --title "CURL" --msgbox "CURL is Installed." 8 45;
       # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        sudo apt install curl
        . splash.sh
        splash 'curl is Installed'
        echo ''
        whiptail --title "CURL" --msgbox "CURL is Installed." 8 45;
    else
        whiptail --title "CURL" --msgbox "CURL is Installed." 8 45;
    fi
}
function All_terminal_Application()
{
    install_gdu
    install_Curl
    install_PowersaveMode
    install_neofetch
    install_htop
    install_lsd
    whiptail --title "All Terminal Application" --msgbox "All Terminal Applications are Installed." 8 45;
}
function learn_terminal_Application()
{
    whiptail --title "Info about Terminal Application" --msgbox "gud: Is a Disk Anazlyizer which can help you to detect all of the space in your system.

lsd: Lsd application is alternative way to use terminal, You use ls command on terminal to view all the files using lsd command you can make you terminal a beautiful.

Cul: cURL, often just “curl,” is a free command line tool. It uses URL syntax to transfer data to and from servers. curl is a widely used because of its ability to be flexible and complete complex tasks. For example, you can use curl for things like user authentication, 

git: git clone is a Git command line utility which is used to target an existing repository and create a clone, or copy of the target repository. In this page we'll discuss extended configuration options and common use cases of git clone. Some points we'll cover here are:

    Cloning a local or remote repository
    Cloning a bare repository
    Using shallow options to partially clone repositories
    Git URL syntax and supported protocols
    
htop: Htop is an interactive system monitor, process viewer and process manager designed for Unix systems. Originally designed as an alternative to the Unix program top, it provides much of the same functionality as top, but offers much greater flexibility over how system processes can be viewed. Unlike top, htop provides the full list of running processes instead of the top resource-consuming ones. Htop can display processes as a tree and uses color to provide resource-usage statistics.
    
Neofetch is a super-convenient command-line utility used to fetch system information within a few seconds. It is cross-platform, open-source, and it displays everything ranging from your system’s uptime to the Linux kernel version. This guide will explain the working of Neofetch, its features, and the method of installing it.

CPU Frequence Changer Power Saver: Automatic CPU speed & power optimizer for Linux based on active monitoring of laptop's battery state, CPU usage, CPU temperature and system load. Ultimately allowing you to improve battery life without making any compromises." 45 100;


}