#!/bin/bash
#zoeken naar alle gewone gebruikers op het systeem

bestand="/etc/passwd"
user="niemand"


for lijn in $(cat "$bestand"|cut -d: -f3)
#do if [$("$lijn"|cut -d: -f3 ) -ge "1000" ] cut werkt enkel op file?
do 
if [ $lijn -ge 1000 ]
then  echo $(id -un $lijn) 
#else echo "${lijn} is geen gewone gebruiker"
fi
done