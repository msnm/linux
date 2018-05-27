#!/bin/bash
#Author: msnm
#Createdon: Sa Mai 19 22:55:03 CEST 2018
#Purpose: searching all common users on the system

path="/etc/passwd"

for line in $(cat $path); do
  usernr=$(echo $line | cut -d : -f3)
  if [[ $usernr -ge 1000 ]] 2>/dev/null; then
    echo $(echo $line | cut -d : -f5)
  fi
done


