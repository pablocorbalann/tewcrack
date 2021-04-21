# This script is the main script for running the attack itself, without
# any kind of interface.
# This script can be run directly from the base directory if you do something
# like: bash run.sh "route to the attack", but it's not the best option, you should
# run the tewcrack.sh option, and it will check a lot of things that are needed to
# run this script, then you can select the second option and that's it!
# Good luck and use the script at your own risk!
# For more information check out: github.com/pablocorbalann/tewcrack.sh

. core/funcs.sh

# constants
CANCELL_KEY="q"

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

# display the networks
echo "     IN-USE              SSID                             MODE   CHAN  RATE        SIGNAL  BARS  SECURITY"
for (( i=0; i<nets_size; i++)); do
  print_option "$i" "${networks[$i]}"
  counter+=1
done

read -p "Type the index of the network you want to attack, or type '$CANCELL_KEY' to cancell: " target_index
if [ $target_index == "$CANCELL_KEY" ]; then 
  ok "Attack cancelled"
  exit 0
fi

target_text="${networks[$target_index]}"
echo "We are going to attack the following wifi network:"
echo "$target_text"
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

# separate the target in values, so we have a list composed of:
# in use - ssid - mode - chan - rate - signal - bars - security
target_values=$(echo $target_text | tr " " "\n")


for i in "${target_values[@]}"; do
  echo "value $i: ${target_values[$i]}"
done

# we are going to store the information in a dictionary
declare -A target
target["in-use"]="> $target_values[0]"
target["ssid"]="> $target_values[1]"
target["mode"]="> $target_values[2]"
target["chan"]="> $target_values[3]"
target["rate"]="> $target_values[4]"
target["signal"]="> $target_values[5]"
target["bars"]="> $target_values[6]"
target["security"]="> $target_values[7]"

# ==== DEBUG
for i in "${!target[@]}"
do
    echo "key  : $i"
      echo "value: ${array[$i]}"
    done
# ====

# Clean all the files and all of that stuff
ok "The attack has ended, please give us a couple of seconds to clean all the mess!"
rm -rf $2
sleep 2.0
