# This file is part of tewcrack: github.com/pblcc/tewcrack
#
# This script displays some information about the script and the
# tewcrack application and their programmers.
# 
# !Please do not touch the rest of the script

# Declare some colors
BOLD="\033[1m"
NC="\033[0m"

clear

# Print the title of the app and then display some information
sh core/title.sh
echo " "
echo "${BOLD}About us${NC}"
echo " "
echo "Hey, I'm Pablo Corbalán, And I'm the creator of this tool!"
echo " "
echo "Using this tool, you can crack the password of a wifi network"
echo "This tool uses a dictionary of words and some linux tools to try crack them"
echo " "
echo "You can check the GitHub page: https://github.com/pblcc/tewcrack for more information"
echo " "
echo "Follow me on Twitter: @pablocorbcon | GitHub: @pblcc"
echo " "

# sleep some time to then return to the back menu
sleep 6.0
bash tewcrack.sh
