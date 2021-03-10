#!/bin/bash

# This file is part of tewcrack: github.com/pblcc/tewcrack
#
# It's the main script of the application, for more information please
# check the github page of this application.
#
# For running this script use: sh tewcrack
# 
# !Please do not touch the rest of the script

# declarate some constants
PROGRAM_FILE="tewcrack.sh"
OPTIONS_FILE_ROUTE="options.txt"
GITHUB_REPO="https://github.com/pablocorbalann/tewcrack"
TWITTER_PROFILE="https://twitter.com/pablocorbalann"

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
  "3")
    open_page "$GITHUB_REPO"
    ;;
  "4")
    open_page "$TWITTER_PROFILE"
    ;;
  *) error "The option has not been found...";;
esac

if program_exists "bash"; then
  bash "${PROGRAM_FILE}"
fi
