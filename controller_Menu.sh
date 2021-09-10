#!/bin/bash

#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */


function controller_Menu()
{
    while :; do
        ADVSEL=$(whiptail --title "Welcome to Application Installer" --fb --menu "Choose an option" --cancel-button "${textexit} Back" 25 60 15 \
                "1" "Install GUI Application" \
                "2" "Install CLI Application"  3>&1 1>&2 2>&3)
            case $ADVSEL in
                1)
                    if (whiptail --title "Alert!!" --yesno "Are you sure?." 10 60) 
                    then
                        . GUI_Meun.sh        
                        GUI_Menu
                    else
                        whiptail --title "Alert!!" --msgbox "Choose Again!!!" 8 45;
                        controller_Menu
                    fi
                ;;
                2)
                    if (whiptail --title "Alert!!" --yesno "Are you sure?." 10 60) 
                    then
                        . Terminal-Application-Menu.sh
                        terminal_application_menu_arch 
                    else
                        whiptail --title "Alert!!" --msgbox "Choose Again!!!" 8 45;
                        controller_Menu
                    fi
                ;;
        esac

        textexit="Yes"
        if (textexit=="Yes") 
        then
            remove_Permisiion
            . splash.sh
            splash 'BYE!!! Have a Good Day.'
            exit 0
         fi
    done
}
controller_Menu