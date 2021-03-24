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
# Requirements:
#   - bash interpreter 'bash'
#   - shell interpreter 'sh'
#
# Please, modify this constants if you consider it
PROGRAM_FILE="tewcrack.sh"
OPTIONS_FILE_ROUTE="options.txt"
GITHUB_REPO="https://github.com/pablocorbalann/tewcrack"
TWITTER_PROFILE="https://twitter.com/pablocorbalann"

# PLEASE DO NOT TOUCH THE REST OF THE SCRIPT IF YOU DONT KNOW WHAT YOU ARE DOING 

# declarate some functions that have to be used
. core/funcs.sh

if ! program_exists "bash"; then
  error "The program can't find the bash interpreter..."
fi

if ! program_exists "sh"; then 
  error "The program can't find the shell interpreter..."
fi

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
      error "You have not supplied the route of the dictionary attack..."
      exit 1
    fi
    # If the user has passed a route using the cli parameters, we ask for a confirmation and 
    # then we run the attack
    ok "Running the attack from '$1'"
    read -p "Are you sure you want to run this attack? (y/N): " confirmation
    if [ $confirmation == "y" ]; then 
      bash core/run.sh $1
    fi
    sleep 1.0
    ;;
  "3")
    open_page "$GITHUB_REPO"
    ;;
  "4")
    open_page "$TWITTER_PROFILE"
    clear
    ;;
  "5")
    ok "See you soon!"
    exit 
    ;;
  *) error "The option has not been found...";;
esac

bash "$PROGRAM_FILE" $DICT_FILE_ROUTE

clear
sh core/title.sh
ok "Thanks for using tewcrack..."
