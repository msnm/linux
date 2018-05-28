#!/bin/bash
#Author: msnm
#Createdon: Do Mai 24 21:29:01 CEST 2018
#Purpose of concatScripts:


filename=$1
echo $filename
IFS=$'\n'
for file in $(find -maxdepth 1 -iname "$2"); do
        echo $file
        echo "#===================$(basename $file)==============================" >> $filename
        less $file >> $filename
        echo -e "\n" >> $filename
done
unset IFS
