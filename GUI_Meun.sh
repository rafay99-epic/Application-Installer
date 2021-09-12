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
            "1" "Chromium Browser" \
            "2" "Firefox Browser" \
            "3" "Brave Browser" \
            "4" "Google Chrome Browser" \
            "5" "Sublime Text Editor" \
            "6" "Visual Studio Code" \
            "7" "Atom Text Editor" \
            "8" "Brackets Text Editor" \
            "9" "Notion" \
            "10" "Rythmobox Music Player" \
            "11" "VLC" \
            "12" "Pluse Audio" \
            "13" "Android Studio" \
            "14" "Netbean Java IDE" \
            "15" "GitHub Desktop" \
            "16" "Pychar" \
            "17" "Eclipse Java IDE" \
            "18" "Flutter" \
            "19" "Power Shell" \
            "20" "Python 3" \
            "21" "WPS" \
            "22" "Only Office" \
            "23" "Liber Office" \
            "24" "Micrsoft Teams" \
            "25" "Zoom" \
            "26" "Signal Desktop" \
            "27" "Telegram Desktop" \
            "28" "OBS" \
            "29" "Kdlive" \
            "30" "Blender" \
            "31" "GIMP" \
            "32" "Apple Music" \
            "33" "Spotify" \
            "34" "Audcity" \
            "35" "Plex- Media" \
            "36" "Next Cloud" \
            "37" "Google SDK Cloud" \
            "38" "Steam" \
            "39" "Wine" \
            "40" "Bitwarden" \
            "41" "Mailspring" \
            "42" "Stacer" \
            "43" "Slack" \
            "44" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Chromium Browser" --yesno "Are you sure you want to Install Chromium Browser" 10 60) 
                then
                    . GUI_Application.sh
                    chromum
                else
                    whiptail --title "Alert!!!" --msgbox "The Application is not Installed" 8 45;
                fi
                ;;
            2)
                if (whiptail --title "Firefox" --yesno "Do you want to Install Firefox Browser." 10 60) 
                then
                    . GUI_Application.sh
                    firefox
                else
                    whiptail --title "Alert!! " --msgbox "Sorry!! The application is not Installed on this System" 8 45;
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Brave Browser?." 10 60) 
                then
                    . GUI_Application.sh
                    brave
                else
                    whiptail --title "Brave Browser" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Google Chrome?." 10 60) 
                then
                    . GUI_Application.sh
                    google-chrome
                else
                    whiptail --title "Google Chrome" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Sublime Text Editor?." 10 60) 
                then
                    . GUI_Application.sh
                    sublime
                else
                    whiptail --title "Sublime Text Editor" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            6)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Visual Studio Code?." 10 60) 
                then
                    . GUI_Application.sh
                    vs_code
                else
                    whiptail --title "Visual Studio Code" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            7)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Atom Text Editor?." 10 60) 
                then
                    . GUI_Application.sh
                    atom
                else
                    whiptail --title "Atom Text Editor" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            8)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Brackets?." 10 60) 
                then
                    . GUI_Application.sh
                    brackets
                else
                    whiptail --title "Brackets Text Editor" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            9)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Notion?." 10 60) 
                then
                    . GUI_Application.sh
                    notion
                else
                    whiptail --title "Notion" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;
                fi
                ;;
            10)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Rythmobox Music Player?." 10 60) 
                then
                    . GUI_Application.sh
                    rythmobox
                else
                    whiptail --title "Rythmobox" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            11)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install VLC?." 10 60) 
                then
                    . GUI_Application.sh
                    vlc
                else
                    whiptail --title "VLC" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            12)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Pluse Audio?." 10 60) 
                then
                    . GUI_Application.sh
                    pluseAudio
                
                else
                    whiptail --title "Pluse Audio" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            13)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Android Studio?." 10 60) 
                then
                    . GUI_Application.sh
                    android_studio
                
                else
                    whiptail --title "Android Studio" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            14)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Netbean?." 10 60) 
                then
                    . GUI_Application.sh
                    netbean
                
                else
                    whiptail --title "Netbean" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            15)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install GitHub Desktop Application?." 10 60) 
                then
                    . GUI_Application.sh
                    github_desktop
                
                else
                    whiptail --title "GitHub Desktop" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            16)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Pycharm?." 10 60) 
                then
                    . GUI_Application.sh
                    pycharm
                
                else                   
                    whiptail --title "Pychar" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            17)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    eclipse
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            18)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    flutter
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            19)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    powershell
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            20)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    java_JDK
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            21)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    python
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            21)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    WPS
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            22)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    only_office
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            23)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    libreoffice
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            24)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    ms_teams
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            25)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    zoom
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            26)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    signal-desktop
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            27)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    telegram-desktop
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            28)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    obs
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            29)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    kdenlive
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            30)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    blender
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            31)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    gimp
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            32)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    apple-music
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            33)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    spotify
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            34)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    audacity
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            35)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                   plex-media-server 
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            36)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                   next-cloud
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            37)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    google--sdk-cloud
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            38)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    steam
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            39)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    wine
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            40)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    bitwarden
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            41)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    mailspring
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            42)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    stacer
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
                
            43)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install this Application?." 10 60) 
                then
                    . GUI_Application.sh
                    slack
                else                   
                    whiptail --title "Aplication Alert!!" --msgbox "Sorry!! The Application is not Installed on this System" 8 45;   
                fi
                ;;
            44)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    . GUI_Application.sh
                    All_Application
                
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