#!/bin/bash
#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */

#this will call the arch_System.sh file and all of the function will called in this script
function terminal_application_menu_arch()
{
    #this will load all of the function so that we can acces those function in the Menu or in aother function
    . Terminal_application.sh

    #this will import the file check which package manager you are running

    . check-manager.sh

    if [[ "$package_manager" == "pacman" ]];
    then
           decide='Yes';
    while :; do
        
        ADVSEL=$(whiptail --title "Terminal Application Installer" --fb --menu "Choose an option" --cancel-button "${decide} Back" 25 60 15 \
            "1" "Install gdu" \
            "2" "Install lsd" \
            "3" "Install git-clone" \
            "4" "Install htop" \
            "5" "Install neofetch" \
            "6" "Install CPU Frequence Changer" \
            "7" "Install curl" \
            "8" "Cmake"  \
            "9" "Ranger" \
            "10" "Fish Shell" \
            "11" "ZSH Shell" \
            "12" "Learn About theses Terminal Based Application " \
            "13" "Install All Application Listed above" 3>&1 1>&2 2>&3)
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
                    install_git
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
                    install_Curl
                    terminal_application_menu_arch
                else
                    whiptail --title "Curl" --msgbox "Curl is not Installed" 8 45;
                fi
                ;;
            8)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Cmake?." 10 60) 
                then
                    make
                    terminal_application_menu_arch
                else
                    whiptail --title "Cmake" --msgbox "Cmake is not Installed" 8 45;
                fi
                ;;
            9)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Ranger?." 10 60) 
                then
                    app_ranger
                    terminal_application_menu_arch
                else
                    whiptail --title "Ranger" --msgbox "Ranger is not Installed" 8 45;
                fi
                ;;
            10)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install Fish Shell?." 10 60) 
                then
                    shell_fish
                    terminal_application_menu_arch
                else
                    whiptail --title "Fish Shell" --msgbox "Fish Shell is not Installed" 8 45;
                fi
                ;;
            11)
                if (whiptail --title "Alert!!" --yesno "Do you want to Install ZSH Shell?." 10 60) 
                then
                    zsh_shell
                    terminal_application_menu_arch
                else
                    whiptail --title "Zsh Shell" --msgbox "Zsh Shell is not Installed" 8 45;
                fi
                ;;    
            12)
                if (whiptail --title "Alert!!" --yesno "Do you want to Learn about Terminal Base Application?." 10 60) 
                then
                    learn_terminal_Application
                    terminal_application_menu_arch
                fi
                ;;

            13)
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
          #  . Controller_ChoiceMenu_Arch.sh
          #  controller_arch_system
            return_option
        fi
        done 
    elif [[ "$package_manager" == "apt-get" ]];
    then 
           decide='Yes';
            while :; do
        
            ADVSEL=$(whiptail --title "Terminal Application Installer" --fb --menu "Choose an option" --cancel-button "${decide} Back" 25 60 15 \
                "1" "gdu" \
                "2" "lsd" \
                "3" "git-clone" \
                "4" "htop" \
                "5" "neofetch" \
                "6" "CPU Frequence Changer" \
                "7" "curl" \
                "8" "Make" \
                "9" "Ranger" \
                "10" "Fish Shell" \
                "11" "ZSH Shell" \
                "12" "Learn About theses Terminal Based Application " \
                "13" "Install All Application Listed above" 3>&1 1>&2 2>&3)
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
                        install_git
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
                        install_Curl
                        terminal_application_menu_arch
                    else
                        whiptail --title "Curl" --msgbox "Curl is not Installed" 8 45;
                    fi
                    ;;
                8)
                    if (whiptail --title "Alert!!" --yesno "Do you want to Install make?." 10 60) 
                    then
                        make
                        terminal_application_menu_arch
                    else
                        whiptail --title "make" --msgbox "make is not Installed" 8 45;
                    fi
                    ;;    
                9)
                    if (whiptail --title "Alert!!" --yesno "Do you want to Install Ranger?." 10 60) 
                    then
                        app_ranger
                        terminal_application_menu_arch
                    else
                        whiptail --title "Ranger" --msgbox "Ranger is not Installed" 8 45;
                    fi
                    ;;
                10)
                    if (whiptail --title "Alert!!" --yesno "Do you want to Install Fish Shell?." 10 60) 
                    then
                        shell_fish
                        terminal_application_menu_arch
                    else
                        whiptail --title "Fish Shell" --msgbox "Fish Shell is not Installed" 8 45;
                    fi
                    ;;
                11)
                    if (whiptail --title "Alert!!" --yesno "Do you want to Install ZSH Shell?." 10 60) 
                    then
                        zsh_shell
                        terminal_application_menu_arch
                    else
                        whiptail --title "Zsh Shell" --msgbox "Zsh Shell is not Installed" 8 45;
                    fi
                    ;;    
                12)
                    if (whiptail --title "Alert!!" --yesno "Do you want to Learn about Terminal Base Application?." 10 60) 
                    then
                        learn_terminal_Application
                        terminal_application_menu_arch
                    fi
                    ;;
                13)
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
                return_option
            fi
        done 
    else
        echo 'Error Occured!!'
        exit 0
    fi
}
function return_option()
{
    if [[ "$package_manager" == "pacman" ]];
    then
        . controller_Menu.sh
        controller_Menu
        # echo 'program is working'
    elif [[ "$package_manager" == "apt-get" ]];
    then 
       . controller_Menu.sh
        controller_Menu
        #echo 'system is debian'
    else
        echo 'System is Not Supported!!'
        exit 0
    fi

}
terminal_application_menu_arch