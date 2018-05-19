#!/bin/bash
# countdown van 60 naar 0

teller=15

while [ $teller -ge 10 ]
do
tekst="\b\b$teller"
echo -e -n "$tekst"
sleep 1
let "teller-=1"
done

while [ $teller -ge 0 ]
do
tekst="\b\b0$teller"
echo -e -n "$tekst"
sleep 1
let "teller-=1"
done