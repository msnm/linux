#!/bin/bash
#Author: msnm
#Createdon: Do Mai 24 21:08:49 CEST 2018
#Purpose of checkpassword:

regex="^[[:upper:]]{1}[[:print:]]{5}[[:digit:]]{2}$"

read -p "Geef passwoord: " passwoord
if [[ $passwoord =~ $regex ]]; then
  echo "Het passwoord volgt het patroon"
  exit 0
else
  echo "Het passwoord is niet correct!"
  exit 1
fi


