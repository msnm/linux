#!/bin/bash
bestand="users.csv"
echo "jcelis,Jan Celis" > $bestand
echo "pboedt,Piet Boedt" >> $bestand

IFS=$'\n'

for lijn in `cat $bestand`
 do echo $lijn
done