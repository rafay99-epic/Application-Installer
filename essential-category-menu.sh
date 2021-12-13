#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */



#this will import the file check which package manager you are running
. check-manager.sh
. GUI_Application.sh
. GUI_Meun.sh


function essential()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        decide='Yes';
    while :; do
        
        ADVSEL=$(whiptail --title " GUI Application Installer " --fb --menu "Choose from the following Application:" --cancel-button "${decide} Back" 25 60 15 \
            "1" "Bitwarden" \
            "2" "Mailspring" \
            "3" "Slack" \
            "4" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    bitwarden
                    essential
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            2)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    mailspring
                    essential
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    slack
                    essential
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All-All-essencial
                    essential
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
            "1" "Bitwarden" \
            "2" "Mailspring" \
            "3" "Stacer" \
            "4" "Slack" \
            "5" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    bitwarden
                    essential
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            2)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    mailspring
                    essential
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    stacer
                    essential
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
                
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    slack
                    essential
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All-All-essencial
                    essential
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