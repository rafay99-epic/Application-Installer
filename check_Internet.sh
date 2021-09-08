#!/bin/bash

#/**
# * Mohammad Abdul Rafay Autmate Task for Linux
# * Email: 99marafay@gmail.com
# */

#these are buildin funtion for the GUI
function echo_title() {     echo -ne "\033[1;44;37m${*}\033[0m\n"; }
function echo_caption() {   echo -ne "\033[0;1;44m${*}\033[0m\n"; }
function echo_bold() {      echo -ne "\033[0;1;34m${*}\033[0m\n"; }
function echo_danger() {    echo -ne "\033[0;31m${*}\033[0m\n"; }
function echo_success() {   echo -ne "\033[0;32m${*}\033[0m\n"; }
function echo_warning() {   echo -ne "\033[0;33m${*}\033[0m\n"; }
function echo_secondary() { echo -ne "\033[0;34m${*}\033[0m\n"; }
function echo_info() {      echo -ne "\033[0;35m${*}\033[0m\n"; }
function echo_primary() {   echo -ne "\033[0;36m${*}\033[0m\n"; }
function echo_error() {     echo -ne "\033[0;1;31merror:\033[0;31m\t${*}\033[0m\n"; }
function echo_label() {     echo -ne "\033[0;1;32m${*}:\033[0m\t"; }
function echo_prompt() {    echo -ne "\033[0;36m${*}\033[0m "; }

#this will create a flash for user or enter baner
function splash() 
{
    local hr;
    hr=" **$(printf "%${#1}s" | tr ' ' '*')** ";
    echo_title "${hr}";
    echo_title " * $1 * ";
    echo_title "${hr}";
    
}


function check_Internet()
{
    GW=`/sbin/ip route | awk '/default/ { print $3 }'`
checkdns=`cat /etc/resolv.conf | awk '/nameserver/ {print $2}' | awk 'NR == 1 {print; exit}'`
checkdomain=google.com

#some functions


function pingnet
{
  splash 'Checking ping net'
  echo ''
  #Google has the most reliable host name. Feel free to change it.
  tput setaf 6; echo "Pinging $checkdomain to check for internet connection." && echo; tput sgr0;
  ping $checkdomain -c 4

  if [ $? -eq 0 ]
    then
      tput setaf 2; echo && echo "$checkdomain pingable. Internet connection is most probably available."&& echo ; tput sgr0;
      #Insert any command you like here
    else
      echo && echo "Could not establish internet connection. Something may be wrong here." >&2
      #Insert any command you like here
#      exit 1
  fi
}

function pingdns
{
  splash 'Checking Ping DNS'
  #Grab first DNS server from /etc/resolv.conf
  tput setaf 6; echo "Pinging first DNS server in resolv.conf ($checkdns) to check name resolution" && echo; tput sgr0;
  ping $checkdns -c 4
    if [ $? -eq 0 ]
    then
      tput setaf 6; echo && echo "$checkdns pingable. Proceeding with domain check."; tput sgr0;
      #Insert any command you like here
    else
      echo && echo "Could not establish internet connection to DNS. Something may be wrong here." >&2
      #Insert any command you like here
#     exit 1
  fi
}

function httpreq
{
  splash 'Checking http Request'
  tput setaf 6; echo && echo "Checking for HTTP Connectivity"; tput sgr0;
  case "$(curl -s --max-time 2 -I $checkdomain | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
  [23]) tput setaf 2; echo "HTTP connectivity is up"; tput sgr0;;
  5) echo "The web proxy won't let us through";exit 1;;
  *)echo "Something is wrong with HTTP connections. Go check it."; exit 1;;
  esac
#  exit 0
}

splash 'Cheking for LAN connectivity'
# Ping gateway first to verify connectivity with LAN
tput setaf 6; echo "Pinging gateway ($GW) to check for LAN connectivity" && echo; tput sgr0;
if [ "$GW" = "" ]; then
    tput setaf 1;echo "There is no gateway. Probably disconnected..."; tput sgr0;
#    exit 1
fi

ping $GW -c 4

if [ $? -eq 0 ]
then
  tput setaf 6; echo && echo "LAN Gateway pingable. Proceeding with internet connectivity check."; tput sgr0;
  pingdns
  pingnet
  httpreq
  splash 'You have sprong Internet Connection'
  echo ''
  . choose_Distro.sh
  choose_Distro
   
else
    whiptail --msgbox --title "ALert!!" "Unfortunately there is no Internet Connection Please connect to Internet " 20 78;
     exit 
fi


}