#!/bin/bash

#/**
# * Mohammad Abdul Rafay Automate Task for Linux
# * Email: 99marafay@gmail.com
# */

#this section will be importing all of the oyher files which are required
. splash.sh 
. check_Compoents.sh
. choose_Distro.sh
. controller_Menu.sh

 #the function that will check the internet connection is available
connected_to_internet() {
  test_urls="\
  https://snapcraft.io/store \
  https://flathub.org/home \
  https://aur.archlinux.org/ \
  "

  processes="0"
  pids=""

  for test_url in $test_urls; do
    curl --silent --head "$test_url" > /dev/null &
    pids="$pids $!"
    processes=$(($processes + 1))
  done

  while [ $processes -gt 0 ]; do
    for pid in $pids; do
      if ! ps | grep "^[[:blank:]]*$pid[[:blank:]]" > /dev/null; then
        # Process no longer running
        processes=$(($processes - 1))
        pids=$(echo "$pids" | sed --regexp-extended "s/(^| )$pid($| )/ /g")

        if wait $pid; then
          # Success! We have a connection to at least one public site, so the
          # internet is up. Ignore other exit statuses.
          kill -TERM $pids > /dev/null 2>&1 || true
          wait $pids
          return 0
        fi
      fi
    done
    # wait -n $pids # Better than sleep, but not supported on all systems
    sleep 0.1
  done

  return 1
}



  if connected_to_internet; then
        echo ''
        splash "Internet Connection is Good"
        # this will check for different stores adn compoents
        call-method
        #this will redirect to the main GUI
        #choose_Distro
        controller_Menu
        echo ''
  else
      whiptail --title "Error" --msgbox "Check Your Internet Connection" 8 45;
      splash "Sorry Connection is not Good"
      exit 0
  fi




