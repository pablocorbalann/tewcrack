# This script is the main script for running the attack itself, without
# any kind of interface.
# This script can be run directly from the base directory if you do something
# like: bash run.sh "route to the attack", but it's not the best option, you should
# run the tewcrack.sh option, and it will check a lot of things that are needed to
# run this script, then you can select the second option and that's it!
# Good luck and use the script at your own risk!
# For more information check out: github.com/pablocorbalann/tewcrack.sh

. core/funcs.sh

if ! program_exists "nmcli"; then
  error "For running this program you need the network manager command line (nmcli), and it has not been found in your computer, please install it..."
fi

# If the user has reached this point of the script without any problems, it means that
# all the programs that are needed to be installed actually are, remember you can automate
# this process using: bash dependencies.sh
rm -rf $2
nmcli dev wifi >> $2
echo "$(tail -n +2 $2)" > $2

networks=()
while read -r line; do
  networks+=("${line}")
done < "${2}"

# Now we have a list with wifi networks stored at 'networks'
nets_size=${#networks[@]}
ok "We have found $nets_size networks you can attack..."
echo "    IN-USE  SSID           MODE   CHAN  RATE        SIGNAL  BARS  SECURITY"
for (( i=0; i<nets_size; i++)); do
  print_option "${i+1}" "${networks[$i]}"
  counter+=1
done

read -p "Type the index of the network you want to attack, or type '0' to cancell: " target_index
if [ $target_index == "0" ]; then 
  ok "Attack cancelled"
  exit 0
fi

target_text="${networks[$target_index - 1]}"
echo "We are going to attack the following wifi network:"
echo "${target_text}"
read -p "Is this correct? (y/N): " confirm_attack

if [ $confirm_attack != "y" ]; then
  ok "See you soon!"
  exit 0
fi

ok "Now we are going to load the dictionary attack"
echo "This could take several minutes, dependding on the size of the file"

if [ ! -f $1 ]; then
  error "Sorry, but the computer can't find the dictionary attack file: '$1'"
fi

echo "Loading the passwords of the file..."
passwords=()
while read -r line; do
  passwords+=("${line}")
done < "${1}"
passwords_size=${#passwords[@]}
echo "We have loaded $passwords_size passwords to try"

# Clean all the files and all of that stuff
ok "The attack has ended, please give us a couple of seconds to clean all the mess!"
rm -rf $2
sleep 2.0
