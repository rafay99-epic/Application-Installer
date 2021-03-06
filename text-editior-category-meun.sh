#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */



function text-editior-category()
{
    . GUI_Application.sh
    . GUI_Meun.sh
    decide='Yes';
    while :; do
        
        ADVSEL=$(whiptail --title " GUI Application Installer " --fb --menu "Choose from the following Application:" --cancel-button "${decide} Back" 25 60 15 \
            "1" "Sublime Text Editor" \
            "2" "Visual Studio Code" \
            "3" "Brackets Text Editor" \
            "4" "Atom Text Editor" \
            "5" "Notion" \
            "6" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Sublime Text Editor?." 10 60) 
                then
                    sublime
                    text-editior-category
                else
                    whiptail --title "Sublime Text Editor" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            2)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Visual Studio Code?." 10 60) 
                then
                    vs_code
                    text-editior-category
                else
                    whiptail --title "Visual Studio Code" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install brackets Text Editor?." 10 60) 
                then
                    brackets
                    text-editior-category
                else
                    whiptail --title "Atom Text Editor" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Atom?." 10 60) 
                then
                    atom
                    text-editior-category
                else
                    whiptail --title "Brackets Text Editor" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Notion?." 10 60) 
                then
                    notion
                    text-editior-category
                else
                    whiptail --title "Notion" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            6)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All-text-Editior
                    text-editior-category
                
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