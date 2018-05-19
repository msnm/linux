#!/bin/bash
# tonen van luisterende tcp poorten

IFS=$'\n'

for lijn in `netstat -tulpn` 
do
lijn=${lijn//' '}
toestand=${lijn##*:}
connectie=${lijn:0:3}
#echo $connectie
#echo  $toestand
if [ $toestand = "*LISTEN-" ] && [ $connectie = tcp ]
then poort=${lijn#*:}
poort=${poort%%.*}
poort=${poort#::}
poort=${poort%%:::*} 
echo $poort
fi
done

