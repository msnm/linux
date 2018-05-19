#!/bin/bash
#gebruik van de functie date als timer

timestamp1=`date +'%s%N'`
echo "tijd 1: $timestamp1"
zenity --warning --title "Hallo" --text `date`
timestamp2=`date +'%s%N'`
echo "tijd 2: $timestamp2"
duur=$(($timestamp2-$timestamp1))
echo "$duur nanoseconden"
echo "$(($duur/1000000000)) seconden"
echo "$((($duur%1000000000)/1000000)) miliseconden"
echo "$(($duur%1000000)) nanoseconden"
