#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */

# this is very all of the package manager are placed
# declare -A osInfo;
# osInfo[/etc/debian_version]="apt-get"
# osInfo[/etc/alpine-release]="apk"
# osInfo[/etc/centos-release]="yum"
# osInfo[/etc/fedora-release]="dnf"
# osInfo[/etc/arch-release]="pacman"

# #to find the which Os yo are running
# for f in ${!osInfo[@]}
# do
#     if [[ -f $f ]];
#     then
#          package_manager=${osInfo[$f]}
#     fi
# done


function conferences()
{
    #this will import the file check which package manager you are running
    . check-manager.sh
    . GUI_Application.sh
    . GUI_Meun.sh
    
    if [[ "$package_manager" == "pacman" ]];
    then
         decide='Yes';
        while :; do
        
            ADVSEL=$(whiptail --title " GUI Application Installer " --fb --menu "Choose from the following Application:" --cancel-button "${decide} Back" 25 60 15 \
                "1" "Micrsoft Teams" \
                "2" "Zoom" \
                "3" "Signal Desktop" \
                "4" "Telegram Desktop" \
                "5" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    
                    ms_teams
                    conferences
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            2)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    zoom
                    conferences
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    signal-desktop
                    conferences
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    telegram-desktop
                    conferences
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All-conference
                    conferences
                
                else
                    whiptail --title "All Applications" --msgbox "No Application are Installed" 8 45;   
                fi
        esac
       
        if(decide=="Yes")
        then
            GUI_Menu
        fi
    done 
    elif [[ "$package_manager" == "apt-get" ]];
    then 
         decide='Yes';
    while :; do
        ADVSEL=$(whiptail --title " GUI Application Installer " --fb --menu "Choose from the following Application:" --cancel-button "${decide} Back" 25 60 15 \
            "1" "Micrsoft Teams" \
            "2" "Zoom" \
            "3" "Signal Desktop" \
            "4" "Telegram Desktop" \
            "5" "WhatsApp Desktop" \
            "6" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    ms_teams
                    conferences
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            2)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    zoom
                    conferences
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    signal-desktop
                    conferences
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    telegram-desktop
                    conferences
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    whatsApp
                    conferences
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            6)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All-conference
                    conferences
                
                else
                    whiptail --title "All Applications" --msgbox "No Application are Installed" 8 45;   
                fi
        esac
       
        if(decide=="Yes")
        then
            GUI_Menu
        fi
    done 
    else
        echo 'Importamt compoent is not Installed!!!!'
        exit 0
    fi
}