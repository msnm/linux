#!/bin/bash
#Author: msnm
#Createdon: Mo Mai 21 20:37:49 CEST 2018
#Purpose of tijdsmeting:

before=$(date +%s%N)
echo "StartTime=$before"
zenity --warning --title "Hallo" --text $(date)
after=$(date +%s%N)
echo "CloseTime=$after"
duur=$(($after-$before))
echo "$(($duur/1000000000)) seconden"
echo "$((($duur%1000000000)/1000000)) miliseconden"
echo "$(($duur%1000000)) nanoseconden"
