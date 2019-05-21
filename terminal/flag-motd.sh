#!/bin/bash

re="\e[31m"
or="\e[33m"
ye="\e[93m"
gr="\e[32m"
bl="\e[34m"
pu="\e[95m"
# Neutral color & flag pole color 
n="\e[0m"
o="\e[37m"

# System information
[ -r /etc/lsb-release ] && . /etc/lsb-release

if [ -z "$DISTRIB_DESCRIPTION" ] && [ -x /usr/bin/lsb_release ]; then
        # Fall back to using the very slow lsb_release utility
        DISTRIB_DESCRIPTION=$(lsb_release -s -d)
fi

# Update information
if [[ $(/usr/lib/update-notifier/apt-check --human-readable 2> /dev/null) ]]
then
    readarray -t updates <<< $(/usr/lib/update-notifier/apt-check --human-readable)
else
    readarray -t updates <<< "No update information available"
fi

# Get last project directory
lwd=$(basename $(cat $HOME/.lastdir))

printf "%-b" "${o}O${n}"
printf "\n"

printf "%-b" "${o}\\\\#${re}\\\\&q${n}"
printf "%14s" ""
printf "Welcome to %s (%s %s %s)" "$DISTRIB_DESCRIPTION" "$(uname -o)" "$(uname -r)" "$(uname -m)"
printf "\n"

printf "%-b" " ${o}#\\\\${or}@\\\\${re}*@aq.${n}"
printf "\n"

printf "%-b" " ${o}\\\\#${ye}\\\\@&${or}V@@${re}*@,.${n}"
printf "%18s" ""
printf "${updates[0]}"
printf "\n"

printf "%-b" "  ${o}#\\\\${gr}@&@${ye}*&@@${or}*\\\\${re}*&\\\\oo,,.${n}"
printf "%10s" ""
printf "${updates[1]}"
printf "\n"

printf "%-b" "  ${o}\\\\#${bl}\\\\@&${gr}@@&@@,${ye}*\\\\&og,${or}*&\\\\.${n}"
printf "%10s" ""
printf "\n"

printf "%-b" "   ${o}#\\\\${pu}@,${bl}\\\\&@@&,${gr}*@@\\\\&ogg,${ye}*&\\\\.${n}"
printf "%5s" ""
printf "Last project directory: %s" $lwd
printf "\n"

printf "%-b" "   ${o}\\\\#${n}  ${pu}*\\\\&@gg,${bl}\\\\@@%&og\\\\,${gr}*@@%${n}"
printf "%10s" ""
printf "\n"

printf "%-b" "    ${o}#\\\\${n}     ${pu}***^^^^\\\\@g,${bl}@@@@${pu},g${n}"
printf "%10s" ""
printf "\n"

printf "%-b" "    ${o}\\\\#${n}                     ${pu}*${n}"
printf "%10s" ""
printf "\n"
