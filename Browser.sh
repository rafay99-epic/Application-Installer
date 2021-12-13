#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */

. GUI_Application.sh
. GUI_Meun.sh

function category_Menu()
{
    decide='Yes';
    while :; do
        
        ADVSEL=$(whiptail --title " Brower Category " --fb --menu "Choose from the following Application:" --cancel-button "${decide} Back" 25 60 15 \
            "1" "Chromium Browser" \
            "2" "Firefox Browser" \
            "3" "Brave Browser" \
            "4" "Google Chrome" \
            "5" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Chromium Browser" --yesno "Are you sure you want to Install Chromium Browser" 10 60) 
                then
                    chromum
                    category_Menu
                else
                    whiptail --title "Alert!!!" --msgbox "The Application is not Installed" 8 45;
                fi
                ;;
            2)
                if (whiptail --title "Firefox" --yesno "Do you want to Install Firefox Browser." 10 60) 
                then
                    firefox
                    category_Menu
                else
                    whiptail --title "Alert!! " --msgbox "Sorry!! The application is not Installed on this System" 8 45;
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Brave Browser?." 10 60) 
                then
                    brave
                    category_Menu
                else
                    whiptail --title "Brave Browser" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Google Chrome?." 10 60) 
                then
                    google-chrome
                    category_Menu
                else
                    whiptail --title "Google Chrome" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All_Browser
                    category_Menu
                
                else
                    whiptail --title "All Applications" --msgbox "No Application are Installed" 8 45;   
                fi
        esac
       
        if(decide=="Yes")
        then
            GUI_Menu
            
        fi
    done 
}