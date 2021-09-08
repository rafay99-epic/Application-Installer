#!/bin/bash

#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */


function GUI_Menu()
{
    decide='Yes';
    while :; do
        
        ADVSEL=$(whiptail --title " GUI Application Installer " --fb --menu "Choose an option" --cancel-button "${decide} Back" 25 60 15 \
            "1" "Update System" \
            "2" "Install Java JDK" \
            "3" "Install Netbeans" \
            "4" "Install Spotify" \
            "5" "Install Android Studio" \
            "6" "Install Visual Studio Code" \
            "7" "Install Discord" \
            "8" "Install Microsoft Teams" \
            "9" "Install Only Office" \
            "10" "Install Notion" \
            "11" "Install Bitwarden" \
            "12" "Install Chromium Browser" \
            "13" "Install Firefox Browser" \
            "14" "Install Brave Browser" \
            "15" "Install Atom Text Editior" \
            "16" "Install Sublime Text Editior" \
            "17" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to update your System?." 10 60) 
                then
                    . GUI_Application.sh
                    system_update
                    GUI_Menu
                else
                    whiptail --title "System Update" --msgbox "Your System is not Updated!" 8 45;
                fi
                ;;
            2)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Java JDK?." 10 60) 
                then
                    . GUI_Application.sh
                    java_JDK
                    GUI_Menu
                else
                    whiptail --title "Java JDK" --msgbox "Java JDK is not Installed" 8 45;
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Netbean?." 10 60) 
                then
                    . GUI_Application.sh
                    netbean
                    GUI_Menu
                else
                    whiptail --title "Netbeans" --msgbox "netbeans is not Installed" 8 45;
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Spotify?." 10 60) 
                then
                    . GUI_Application.sh
                    spotify
                    GUI_Menu
                else
                    whiptail --title "Spotify" --msgbox "Spotify is not Installed" 8 45;
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Android Studio?." 10 60) 
                then
                    . GUI_Application.sh
                    android_studio
                    GUI_Menu
                else
                    whiptail --title "Android Studio" --msgbox "Android Studio is not Installed" 8 45;
                fi
                ;;
            6)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Visual Studio Code?." 10 60) 
                then
                    . GUI_Application.sh
                    vs_code
                    GUI_Menu
                else
                    whiptail --title "Visual Studio Code" --msgbox "Visual Studio Code is not Installed" 8 45;
                fi
                ;;
            7)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Discord?." 10 60) 
                then
                    . GUI_Application.sh
                    discord
                    GUI_Menu
                else
                    whiptail --title "Discord" --msgbox "Discord is not Installed" 8 45;
                fi
                ;;
            8)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Microsoft Teams?." 10 60) 
                then
                    . GUI_Application.sh
                    ms_teams
                    GUI_Menu
                else
                    whiptail --title "Microsoft Teams" --msgbox "Microsoft Teams is not Installed" 8 45;
                fi
                ;;
            9)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Only Office Suite?." 10 60) 
                then
                    . GUI_Application.sh
                    only_office
                    GUI_Menu
                else
                    whiptail --title "Only office Suite" --msgbox "Only Office Suite is not Installed" 8 45;
                fi
                ;;
            10)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Notion?." 10 60) 
                then
                    . GUI_Application.sh
                    notion
                    GUI_Menu
                else
                    whiptail --title "Notion" --msgbox "Notion is not Installed" 8 45;   
                fi
                ;;
            11)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Bitwarden?." 10 60) 
                then
                    . GUI_Application.sh
                    bitwarden
                    GUI_Menu
                else
                    whiptail --title "Bitwarden" --msgbox "Bitwarden is not Installed" 8 45;   
                fi
                ;;
            12)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Chromium?." 10 60) 
                then
                    . GUI_Application.sh
                    chromum
                    GUI_Menu
                else
                    whiptail --title "Chromium" --msgbox "Chromium is not Installed" 8 45;   
                fi
                ;;
            13)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Firefox?." 10 60) 
                then
                    . GUI_Application.sh
                    firefox
                    GUI_Menu
                else
                    whiptail --title "Firefox" --msgbox "Firfox is not Installed" 8 45;   
                fi
                ;;
            14)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Brave?." 10 60) 
                then
                    . GUI_Application.sh
                    brave
                    GUI_Menu
                else
                    whiptail --title "Brave" --msgbox "Brave is not Installed" 8 45;   
                fi
                ;;
            15)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Atom?." 10 60) 
                then
                    . GUI_Application.sh
                    atom
                    GUI_Menu
                else
                    whiptail --title "Atom" --msgbox "Atom is not Installed" 8 45;   
                fi
                ;;
            16)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Sublime?." 10 60) 
                then
                    . GUI_Application.sh
                    sublime
                    GUI_Menu
                else                   
                    whiptail --title "Sublime" --msgbox "Sublime is not Installed" 8 45;   
                fi
                ;;
            17)
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