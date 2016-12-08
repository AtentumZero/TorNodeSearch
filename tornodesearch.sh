#!/bin/sh

# tornodesearch.sh
# A basic shell script to check if an IP address is listed as a Tor node (exit or relay)
# on the Tor DNS (IP-based) blacklists operated by dan.me.uk

# Example command: ./tornodesearch.sh 192.168.0.2

BLISTS="
    tor.dan.me.uk
    torexit.dan.me.uk
"

ERROR() {
  echo $0 ERROR: $1 >&2
  exit 2
}

# Checks for a valid IP address
[ $# -ne 1 ] && ERROR 'Please input a single IP address'

reverse=$(echo $1 |
  sed -ne "s~^\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)$~\4.\3.\2.\1~p")

if [ "x${reverse}" = "x" ] ; then
      ERROR  "'$1' is not a valid IP address"
      exit 1
fi

RDNS=$(dig +short -x $1)

printf "\n Checking $1 against Tor blacklists...\n"
sleep 2
printf "\n Blank results will be listed as --- --- \n \n"
sleep 2
for BL in ${BLISTS} ; do
    printf "%-40s" " ${reverse}.${BL}."
    IPL="$(dig @8.8.8.8 +short -t a ${reverse}.${BL}.)"
    IPT="$(dig @8.8.4.4 +short -t txt ${reverse}.${BL}.)"
    echo ${IPL:----} ${IPT:----}
done

printf "\n"
