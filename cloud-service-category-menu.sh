#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */





function cloud-service() 
{
    #this will import the file check which package manager you are running
    . check-manager.sh
    . GUI_Application.sh
    . GUI_Meun.sh

    if [[ "$package_manager" == "pacman" ]];
    then
        decide='Sure';
        while :; do

            ADVSEL=$(whiptail --title " GUI Application Installer " --fb --menu "Choose from the following Application:" --cancel-button "${decide} Back" 25 60 15 \
                "1" "Next Cloud" \
                "2" "Install All Application Listed above" 3>&1 1>&2 2>&3)
            case $ADVSEL in
                1)
                    if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                    then
                        next-cloud
                        cloud-service
                    else                   
                        whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                    fi
                    ;;
                2)
                    if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                    then
                        All-cloud-services
                        cloud-service 
                    else
                        whiptail --title "All Applications" --msgbox "No Application are Installed" 8 45;   
                    fi
            esac
       
        if(decide=="Sure")
        then
            GUI_Menu
        fi
        done 
    elif [[ "$package_manager" == "apt-get" ]];
    then 
        decide='Yes';
    while :; do
        
        ADVSEL=$(whiptail --title " GUI Application Installer " --fb --menu "Choose from the following Application:" --cancel-button "${decide} Back" 25 60 15 \
            "1" "Next Cloud" \
            "2" "Google SDK Cloud" \
            "3" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                   next-cloud
                   cloud-service
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            2)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    google--sdk-cloud
                    cloud-service
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All-cloud-services
                    cloud-service
                
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