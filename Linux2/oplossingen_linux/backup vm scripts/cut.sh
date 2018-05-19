#!/bin/bash

# Functie: emulatie van cut -c: dus eerst checken of juiste parameter meegegeven
#          oproepen met $0 -c2-10 bestandsnaam
OLD_IFS="$IFS"
IFS=$'\n'
cutme=false
eerste=$1
echo $eerste
optie=${eerste:0:2}
echo $optie
if [ $optie = "-c" ]
	then cutme=true
	van=${eerste#-c} 
	van=${van%-*}
	van=$(($van-1))
	tot=${eerste##*-}
	lengte=$(($tot-$van))
echo $cutme
echo $van
echo $tot
fi 

shift
for lijn in `cat "$@"`
do
if $cutme
then lijn=${lijn:$van:$lengte}
fi
echo $lijn
done

IFS=$OLD_IFS


