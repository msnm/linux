#!/bin/bash
#Author: msnm
#Createdon: Mo Mai 21 19:50:09 CEST 2018
#Purpose of countdown:

countdown=${1:-60}

while [[ $countdown -gt 0 ]]; do
  echo "$countdown sec to go"
  countdown=$(($countdown-1))
  sleep 1
done
echo "Time's up mate!"


