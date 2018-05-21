#!/bin/bash
#Author: msnm
#Createdon: Mo Mai 21 20:10:35 CEST 2018
#Purpose of linecount:
file=${1?"$(basename $0) file"}

OLD_IFS=$IFS
IFS=$'\n'

for line in $(cat $file); do
  count=$(($count+1))
done
#IFS=$OLD_IFS
unset IFS

echo "$count lines in $file"
