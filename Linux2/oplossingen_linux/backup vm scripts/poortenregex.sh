#!/bin/bash
# tonen van luisterende tcp poorten

IFS=$'\n'
regex="^tcp.*:([0-9]+).*LISTEN"

for lijn in `netstat -tulpn` 
do
if [[ $lijn =~ $regex ]]
then echo "${BASH_REMATCH[1]}"
fi 
done

