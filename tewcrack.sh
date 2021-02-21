#!/bin/bash

# This file is part of tewcrack: github.com/pblcc/tewcrack
#
# It's the main script of the application, for more information please
# check the github page of this application.
#
# For running this script use: sh tewcrack
# 
# !Please do not touch the rest of the script

# declarate some functions that have to be used
program_exists() {
  # Checks if a program exists in the current system. If the program exists
  # it'll return True, if the computer can't access to the program it'll return 
  # False. The program to check is $1
  command -v $1 $> /dev/null
}

# start of the script
clear
sh core/title.sh
