#!/bin/bash
#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */


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
                   . Browser.sh
                   category_Menu
                    GUI_Menu
                else
                    whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;
                fi
                ;;
            2)
                if (whiptail --title "Text Editior" --yesno "Are you sure you want to Enter?" 10 60) 
                then
                    . text-editior-category-meun.sh
                    text-editior-category
                    GUI_Menu
                else
                    whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;
                fi
                ;;
            3)
                if (whiptail --title "Multi- Media Category" --yesno "Are you sure you want to Enter?" 10 60) 
                then
                    . MultiMedia-category.sh
                    multi-media
                    GUI_Menu
                else
                    whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            4)
                if (whiptail --title "Development Tools" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    . Development-tools.sh
                    Development-tools
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            5)
                if (whiptail --title "Office Suite" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    . office-category-menu.sh
                    Office-Category
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            6)
                if (whiptail --title "Conference Call Category" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    . conference-call-menu.sh
                    conferences
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            7)
                if (whiptail --title "Graphical Category" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    . graphical-work-category-menu.sh
                    graphical-work
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            8)
                if (whiptail --title "Music Category" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    . music-category-menu.sh
                    music-category-Menu
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            9)
                if (whiptail --title "Cloud Service Category" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    . cloud-service-category-menu.sh
                    cloud-service
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            10)
                if (whiptail --title "Essentical Apps Category" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    . essential-category-menu.sh
                    essential
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            11)
                if (whiptail --title "Games Category" --yesno "Are you sure you want to Enter?." 10 60) 
                then
                    . Games-category-menu.sh
                    games
                    GUI_Menu
                else
                   whiptail --title "Alert!!!" --msgbox "Sorry!! The Category can not be opened!!" 8 45;   
                fi
                ;;
            12)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    . GUI_Application.sh
                    All_Application
                    GUI_Menu
                
                else
                    whiptail --title "All Applications" --msgbox "No Application are Installed" 8 45;   
                fi
        esac
       
        if(decide=="Yes")
        then
            . controller_Menu.sh
            controller_Menu
        fi
    done 
}
GUI_Menu