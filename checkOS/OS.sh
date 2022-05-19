#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */

declare -A osInfo;
osInfo[/etc/debian_version]="apt-get"
osInfo[/etc/arch-release]="pacman"

#to find the which Os yo are running
for f in ${!osInfo[@]}
do
    if [[ -f $f ]];
    then
         package_manager=${osInfo[$f]}
    fi
done

function os_check() 
{
    if [[ "$package_manager" == "pacman" ]];
    then
        cd Arch
        python3 arch.py
        cd ../
    elif [[ "$package_manager" == "apt-get" ]];
    then
        cd Debian
        python3 arch.py
        cd ../
    else
        echo 'System is Not Supported!!'
        exit 0
    fi
}
os_check