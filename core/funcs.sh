# This file is part of tewcrack: github.com/pblcc/tewcrack
#
# It's the script that contains all the functions that are used in the 
# application.
#
# !Please do not touch the script

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'

BOLD='\033[1m'
ITALIC='\033[3m'
NORMAL="\033[0m"

color_print() {
  if [ -t 1 ]; then
      echo -e "${@}${NORMAL}"
  else
      echo -e "${@}" | sed "s/\\\033\[[0-9;]*m//g"
  fi
}


stderr_print() {
  # Prints a text using a color in the stderr format
  color_print "$@" >&2
}

bold() {
  # Prints text in bold 
  stderr_print "${BOLD}${1}"
}

ok() {
  # Prints some text as ok, without errors
  bold "${GREEN}${1}"
}

warn() {
  # Prints some text as a warning
  bold "${YELLOW}${1}"
}

error() {
  # Prints some text as an error and exits the app
  bold "${RED}${1}"
  exit 1
}

program_exists() {
  # Checks if a program exists in the current system. If the program exists
  # it'll return True, if the computer can't access to the program it'll return 
  # False. The program to check is $1
  command -v $1 $> /dev/null
}

print_option() {
  # This function prints an option formatted to then read it.
  # using two parameters: [index] name
  local index="$BOLD$PURPLE[$NORMAL$BOLD$1$PURPLE]$NORMAL"
  echo -e "$index: $2"
}

open_page() {
  # This function is used for opening a page in the browser
  if ! program_exists "xdg-open"; then
    stederr_print "${RED}You have to install xdg-tools for using this option..."
  else
    echo "$2"
  fi
  xdg-open "$1"
}
