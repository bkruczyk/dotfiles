#!/bin/sh

if [ -z $1 ] || [ -z $2 ]; then
    echo "Parameters not set. Aborting."
    exit 1
fi

i=0

while :; do
    if [ $i -lt $2 ]; then
        x=$2
        echo -e "\n\E[35m==> Running quick sync. Full sync after $((x - i)) quick syncs.\E[0m\n"
        offlineimap -o -q -f INBOX -l ~/.offlineimap.log
        i=$((i+1))
    else
        echo -e "\n\E[35m==> Running full sync.\E[0m\n"
        offlineimap -o -l ~/.offlineimap.log
        i=0
    fi
    sleep $1
done

