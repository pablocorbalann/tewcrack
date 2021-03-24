# This script is the main script for running the attack itself, without
# any kind of interface.
# This script can be run directly from the base directory if you do something
# like: bash run.sh "route to the attack", but it's not the best option, you should
# run the tewcrack.sh option, and it will check a lot of things that are needed to
# run this script, then you can select the second option and that's it!
# Good luck and use the script at your own risk!
# For more information check out: github.com/pablocorbalann/tewcrack.sh

. funcs.sh

if ! program_exists "nmcli"; then
  error "For running this program you need the network manager command line (nmcli), and it has not been found in your computer, please install it..."
fi

# If the user has reached this point of the script without any problems, it means that
# all the programs that are needed to be installed actually are, remember you can automate
# this process using: bash dependencies.sh
wifi="$(nmcli dev wifi)"
echo $wifi
