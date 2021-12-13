#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */

. GUI_Application.sh
. GUI_Meun.sh

function multi-media()
{
    decide='Yes';
    while :; do
        
        ADVSEL=$(whiptail --title " GUI Application Installer " --fb --menu "Choose from the following Application:" --cancel-button "${decide} Back" 25 60 15 \
            "1" "Rythmobox Music Player" \
            "2" "VLC" \
            "3" "Pluse Audio" \
            "4" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Rythmobox Music Player?." 10 60) 
                then
                    rythmobox
                    multi-media
                else
                    whiptail --title "Rythmobox" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            2)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install VLC?." 10 60) 
                then
                    vlc
                    multi-media
                else
                    whiptail --title "VLC" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Pluse Audio?." 10 60) 
                then
                    pluseAudio
                    multi-media
                
                else
                    whiptail --title "Pluse Audio" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All-Multi-Media
                    multi-media
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
