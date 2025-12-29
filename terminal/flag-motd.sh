#!/usr/bin/env bash

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
# [ -r /etc/lsb-release ] && . /etc/lsb-release

# if [ -z "$DISTRIB_DESCRIPTION" ] && [ -x /usr/bin/lsb_release ]; then
        # Fall back to using the very slow lsb_release utility
#        DISTRIB_DESCRIPTION=$(lsb_release -s -d)
# fi

# Begin design
printf "%-b" "${o}O${n}"
printf "\n"

printf "%-b" "${o}\\\\#${re}\\\\&q${n}"
printf "%14s" ""
printf "settings:"
# printf "Welcome to %s (%s %s %s)" "$DISTRIB_DESCRIPTION" "$(uname -o)" "$(uname -r)" "$(uname -m)"
printf "\n"

printf "%-b" " ${o}#\\\\${or}@\\\\${re}*@aq.${n}"
printf "%12s" ""
printf "ctrl+,"
printf "\n"

printf "%-b" " ${o}\\\\#${ye}\\\\@&${or}V@@${re}*@,.${n}"
printf "%15s" " "
printf "split right : alt+shift+plus"
printf "\n"

printf "%-b" "  ${o}#\\\\${gr}@&@${ye}*&@@${or}*\\\\${re}*&\\\\oo,,.${n}"
printf "%8s" " "
printf "split down : alt+shift+minus"
printf "\n"

printf "%-b" "  ${o}\\\\#${bl}\\\\@&${gr}@@&@@,${ye}*\\\\&og,${or}*&\\\\.${n}"
printf "%8s" " "
printf "settings : ctrl+comma"
printf "\n"

printf "%-b" "   ${o}#\\\\${pu}@,${bl}\\\\&@@&,${gr}*@@\\\\&ogg,${ye}*&\\\\.${n}"
printf "\n"

printf "%-b" "   ${o}\\\\#${n}  ${pu}*\\\\&@gg,${bl}\\\\@@%&og\\\\,${gr}*@@%${n}"
printf "\n"

printf "%-b" "    ${o}#\\\\${n}     ${pu}***^^^^\\\\@g,${bl}@@@@${pu},g${n}"
printf "\n"

printf "%-b" "    ${o}\\\\#${n}                     ${pu}*${n}"
printf "\n"

printf "%-b" "     ${o}#\\\\${n}"
printf "\n"
