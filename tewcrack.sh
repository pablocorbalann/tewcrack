#!/bin/bash
# This file is part of tewcrack: github.com/pblcc/tewcrack
#
# Tewcrack is a small shell tool for running a Dictionary attack in an specific Wifi
# network from your terminal. If you want to install Tewcrack, you can run the install.sh
# script of this file
#
# For running this script use:
#
#   bash tewcrack.sh <dict_route>
#
# the route of the dictionary attack, <dict_route> where all the paIf you want you can
# modify it from one of the constants above. By default his dictionary consists of the 1000
# most used passwords.
DICT_FILE_ROUTE="dict"
PROGRAM_FILE="tewcrack.sh"
OPTIONS_FILE_ROUTE="options.txt"
GITHUB_REPO="https://github.com/pablocorbalann/tewcrack"
TWITTER_PROFILE="https://twitter.com/pablocorbalann"

# PLEASE DO NOT TOUCH THE REST OF THE SCRIPT IF YOU DONT KNOW WHAT YOU ARE DOING 

# declarate some functions that have to be used
. core/funcs.sh

# start of the script
clear
sh core/title.sh

# Read the options from the file and print them
options=()
while read -r line; do
  options+=("${line}")
done < "${OPTIONS_FILE_ROUTE}"

declare -i counter=0
for option in "${options[@]}"; do
  counter+=1
  print_option "${counter}" "${option}"
done

# Read the option and store it inside the option variable
read -p "Select the option you want to perform: " option

# Evaluate the user input and call the corresponding function
case $option in 
  "1")
    sh core/about.sh
    ;;
  "2")
    # Check if the user passed a route using parameters (located at $1)
    if [ -z "$1" ]; then 
      warn "No argument supplied to the attack core..."
      read -p "Type the route of the dictionary file ('N' to cancell): " dattack
      if [ "$DICT_FILE_ROUTE" == "N" ]; then
        error "Attack cancelled..."
        exit
      fi
    else
      dattack="$DICT_FILE_ROUTE"
    fi
    # ask the user to confirm the attack
    read -p "Are you sure you would like to run the attack? (y/N): " confirmation
    if [ $confirmation == "y" ]; then
      # Now call the start script with this route
      ok "Running the attack from $dattack..."
      sleep 2.0
    fi
    ;;
  "3")
    open_page "$GITHUB_REPO"
    ;;
  "4")
    open_page "$TWITTER_PROFILE"
    clear
    ;;
  *) error "The option has not been found...";;
esac

if program_exists "bash"; then
  bash "$PROGRAM_FILE" $DICT_FILE_ROUTE
fi

clear
sh core/title.sh
ok "Thanks for using tewcrack..."
