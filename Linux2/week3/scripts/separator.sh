#!/bin/bash
#Author: msnm
#Createdon: Mo Mai 21 21:10:03 CEST 2018
#Purpose of separator:
bestand="users.csv"
echo "jcellis,Jan Celis" > $bestand
echo "pboedt, piet boedt" >> $bestand

IFS=$'\n'
for lijn in $(cat $bestand); do
  echo $lijn
done
unset IFS


