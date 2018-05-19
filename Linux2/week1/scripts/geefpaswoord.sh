#!/bin/bash
#Author: msnm
#Createdon: Sa Mai 19 23:21:20 CEST 2018
#Purpose of createScript.sh: reading userinput

paswoord="123"
read -s -p "Paswoord: " mogelijkpaswoord

if [[ $paswoord = $mogelijkpaswoord ]]; then
  echo "Toegelaten"
  exit 0
else
  echo "Verboden"
  exit 1
fi
