#!/bin/bash

#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */

function controller_arch_system()
{
    while :; do
        ADVSEL=$(whiptail --title "Choose Application Installer" --fb --menu "Choose an option" --cancel-button "${textexit} Back" 25 60 15 \
                "1" "Install GUI Application" \
                "2" "Install Terminal Based Application (Programs)"  3>&1 1>&2 2>&3)
            case $ADVSEL in
                1)
                    if (whiptail --title "Alert!!" --yesno "Are you sure?." 10 60) 
                    then        
                        # Arch System Application will be called
                        . Arch_System.sh
                        Arch_System
                    else
                        whiptail --title "Alert!!" --msgbox "Choose Again!!!" 8 45;
                        controller_arch_system
                    fi
                ;;
                2)
                    if (whiptail --title "Alert!!" --yesno "Are you sure?." 10 60) 
                    then
                    # PREVIOUS Code
                        # Terminal Application Menu will be called
                        . Terminal_application_Menu_For_Arch.sh
                        terminal_application_menu_arch 
                        #terminal_application_menu_arch
                    # NEW CODE:
                       # whiptail --title "Alert!!" --msgbox "Choose Again!!!" 8 45;
                       # controller_arch_system
                    else
                        #PREVIOUS CODE

                        whiptail --title "Alert!!" --msgbox "Choose Again!!!" 8 45;
                        controller_arch_system

                        # NEW CODE:

                        #. Terminal_application_Menu_For_Arch.sh
                        #terminal_application_menu_arch 
                    
                    fi
                    ;;
        esac

        textexit="Yes"
        if (textexit=="Yes") 
        then
            #choice Menu will be called 
            . choice_Distro.sh
            choice_Menu
         fi
    done
}
controller_arch_system