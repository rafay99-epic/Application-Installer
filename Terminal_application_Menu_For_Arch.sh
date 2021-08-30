#!/bin/bash
#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */

#this will load all of the function so that we can acces those function in the Menu or in aother function
. Terminal_application.sh


#this will call the arch_System.sh file and all of the function will called in this script
function terminal_application_menu_arch
{
    decide='Yes';
    while :; do
        
        ADVSEL=$(whiptail --title "Terminal Application Installer for Arch System" --fb --menu "Choose an option" --cancel-button "${decide} Back" 25 60 15 \
            "1" "Install gdu" \
            "2" "Install lsd" \
            "3" "Install git-clone" \
            "4" "Install htop" \
            "5" "Install neofetch" \
            "6" "Install CPU Frequence Changer" \
            "7" "Install curl" \
            "8" "Learn About theses Terminal Based Application " \
            "9" "Install All Application Listed above" 3>&1 1>&2 2>&3)
        case $ADVSEL in
            1)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install gdu?." 10 60) 
                then
                    install_gdu
                    terminal_application_menu_arch
                else
                    whiptail --title "gdu" --msgbox "gdu is not Installed" 8 45;
                fi
                ;;
            2)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install lsd?." 10 60) 
                then
                    install_lsd
                    terminal_application_menu_arch
                else
                    whiptail --title "lsd" --msgbox "lsd is not Installed" 8 45;
                fi
                ;;
            3)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Git?." 10 60) 
                then
                    install_git_arch
                    terminal_application_menu_arch
                else
                    whiptail --title "Git" --msgbox "Git is not Installed" 8 45;
                fi
                ;;
            4)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install htop?." 10 60) 
                then
                    install_htop
                    terminal_application_menu_arch
                else
                    whiptail --title "htop" --msgbox "htop not Installed" 8 45;
                fi
                ;;
            5)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Neofetch?." 10 60) 
                then
                    install_neofetch
                    terminal_application_menu_arch
                else
                    whiptail --title "Neofetch" --msgbox "Neofetch is not Installed" 8 45;
                fi
                ;;
            6)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install CPU Frequence Changer?." 10 60) 
                then
                    install_PowersaveMode
                    terminal_application_menu_arch
                else
                    whiptail --title "CPU Frequence Changer" --msgbox "CPU Frequence Changer is not Installed" 8 45;
                fi
                ;;
            7)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Curl?." 10 60) 
                then
                    install_Curl_arch
                    terminal_application_menu_arch
                else
                    whiptail --title "Curl" --msgbox "Curl is not Installed" 8 45;
                fi
                ;;
            8)
                if (whiptail --title "Alert!!" --yesno "Do you want to Learn about Terminal Base Application?." 10 60) 
                then
                    learn_terminal_Application
                    terminal_application_menu_arch
                fi
                ;;

            9)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install All Application?." 10 60) 
                then
                    All_terminal_Application
                    terminal_application_menu_arch
                else
                    whiptail --title "All Applications" --msgbox "No Application are Installed" 8 45;   
                fi
        esac
        if(decide=="Yes")
        then
            . Controller_ChoiceMenu_Arch.sh
            controller_arch_system
        fi
    done 
}
terminal_application_menu_arch