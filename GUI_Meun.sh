#!/bin/bash
#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */

. Browser.sh
. text-editior-category-meun.sh
. MultiMedia-category.sh
. Development-tools.sh
. office-category-menu.sh
. conference-call-menu.sh
. graphical-work-category-menu.sh
. music-category-menu.sh
. cloud-service-category-menu.sh
. essential-category-menu.sh
. Games-category-menu.sh
. GUI_Application.sh
. controller_Menu.sh

function GUI_Menu()
{
    decide='Yes';
    while :; do
        
        ADVSEL=$(whiptail --title " GUI Application Installer " --fb --menu "Choose from the following Application:" --cancel-button "${decide} Back" 25 60 15 \
            "1" "Browser Category" \
            "2" "Text Editior Category" \
            "3" "Multi-Media Category" \
            "4" "Devloperment Tools Category" \
            "5" "Office Suite Category" \
            "6" "Conference Call Category" \
            "7" "Graphically Category" \
            "8" "Music Category" \
            "9" "Cloud Service Category" \
            "10" "Essentical Apps Category" \
            "11" "Games Category" \
            "12" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Browser Category" --yesno "Are you sure you want to Enter?" 10 60) 
                then
                   category_Menu
                    GUI_Menu
                else
                    whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;
                fi
                ;;
            2)
                if (whiptail --title "Text Editior" --yesno "Are you sure you want to Enter?" 10 60) 
                then
                    text-editior-category
                    GUI_Menu
                else
                    whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;
                fi
                ;;
            3)
                if (whiptail --title "Multi- Media Category" --yesno "Are you sure you want to Enter?" 10 60) 
                then
                    multi-media
                    GUI_Menu
                else
                    whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            4)
                if (whiptail --title "Development Tools" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    Development-tools
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            5)
                if (whiptail --title "Office Suite" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    Office-Category
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            6)
                if (whiptail --title "Conference Call Category" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    conferences
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            7)
                if (whiptail --title "Graphical Category" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    graphical-work
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            8)
                if (whiptail --title "Music Category" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    music-category-Menu
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            9)
                if (whiptail --title "Cloud Service Category" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    cloud-service
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            10)
                if (whiptail --title "Essentical Apps Category" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    essential
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            11)
                if (whiptail --title "Games Category" --yesno "Are you sure you want to Enter?." 10 60) 
                then   
                    games
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            12)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All_Application
                    GUI_Menu
                
                else
                    whiptail --title "All Applications" --msgbox "No Application are Installed" 8 45;   
                fi
        esac
       
        if(decide=="Yes")
        then
            controller_Menu
        fi
    done 
}