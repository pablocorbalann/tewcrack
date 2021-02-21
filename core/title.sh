#! bin/bash

# This file is part of tewcrack: github.com/pblcc/tewcrack
#
# This script prints the title of the app
# 
# !Please do not touch the rest of the script

# Declare some colors
BLUE="\033[0;36m"
BOLD="\033[1m"
NC="\033[0m"

# display some titles and some information
echo "${BLUE}${BOLD}"
cat << "INTRO"

  $$\                                                                    $$\
  $$ |                                                                   $$ \
$$$$$$\    $$$$$$\  $$\  $$\  $$\  $$$$$$$\  $$$$$$\  $$$$$$\   $$$$$$$\ $$ |  $$\
\_$$  _|  $$  __$$\ $$ | $$ | $$ |$$  _____|$$  __$$\ \____$$\ $$  _____|$$ | $$  |
  $$ |    $$$$$$$$ |$$ | $$ | $$ |$$ /      $$ |  \__|$$$$$$$ |$$ /      $$$$$$  /
  $$ |$$\ $$   ____|$$ | $$ | $$ |$$ |      $$ |     $$  __$$ |$$ |      $$  _$$<
  \$$$$  |\$$$$$$$\ \$$$$$\$$$$  |\$$$$$$$\ $$ |     \$$$$$$$ |\$$$$$$$\ $$ | \$$\
   \____/  \_______| \_____\____/  \_______|\__|      \_______| \_______|\__|  \__|
INTRO
echo "${NC}"

