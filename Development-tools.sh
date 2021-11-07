function Development-tools()
{
    decide='Yes';
    while :; do
        
        ADVSEL=$(whiptail --title " GUI Application Installer " --fb --menu "Choose from the following Application:" --cancel-button "${decide} Back" 25 60 15 \
            "1" "Android Studio" \
            "2" "Netbean Java IDE" \
            "3" "GitHub Desktop" \
            "4" "Pychar" \
            "5" "Eclipse Java IDE" \
            "6" "Flutter" \
            "7" "Power Shell" \
            "8" "Java JDK" \
            "9" "Python3" \
            "10" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Android Studio?." 10 60) 
                then
                    . GUI_Application.sh
                    android_studio
                    Development-tools
                else
                    whiptail --title "Android Studio" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            2)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Netbean?." 10 60) 
                then
                    . GUI_Application.sh
                    netbean
                    Development-tools
                else
                    whiptail --title "Netbean" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install GitHub Desktop Application?." 10 60) 
                then
                    . GUI_Application.sh
                    github_desktop
                    Development-tools
                
                else
                    whiptail --title "GitHub Desktop" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Pycharm?." 10 60) 
                then
                    . GUI_Application.sh
                    pycharm
                    Development-tools   
                else                   
                    whiptail --title "Pychar" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    eclipse
                    Development-tools
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            6)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    flutter
                    Development-tools
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            7)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    powershell
                    Development-tools
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            8)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    java_JDK
                    Development-tools
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            9)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    python
                    Development-tools
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            10)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    . GUI_Application.sh
                    All-Devloper
                    Development-tools
                
                else
                    whiptail --title "All Applications" --msgbox "No Application are Installed" 8 45;   
                fi
        esac
       
        if(decide=="Yes")
        then
            . GUI_Meun.sh
            GUI_Menu
        fi
    done 
    
}