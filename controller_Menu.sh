#!/bin/bash

#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */


function reboot()
{
    echo "A Reboot is Required"
    echo "Enter yes for a rebbot and no to Exit the applications"
    read -p 'Enter Your Choice: ' user_choice

    if [[ "$user_choice" == "yes" || "$user_choice" == "Yes" || "$user_choice" == "YES" || "$user_choice" == "yEs" || "$user_choice" == "yeS"  ]];
    then
        . startup.sh
        remove_Permisiion
        echo "Enter your user Password for reboot"
        sudo reboot now
    elif [[ "$user_choice" == "no" || "$user_choice" == "No" || "$user_choice" == "nO" || "$user_choice" == "NO" ]];
    then
        . startup.sh
        remove_Permisiion
        exit
    else
        . startup.sh
        remove_Permisiion
        exit
    fi
} 

function controller_Menu()
{
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
            reboot
        else
            . startup.sh
            remove_Permisiion
            chmod -x startup.sh
            exit 0
        fi
    
}
