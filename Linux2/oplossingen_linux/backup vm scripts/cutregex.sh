#!/bin/bash

# Functie: emulatie van cut -c: dus eerst checken of juiste parameter meegegeven
#          oproepen met $0 -c2-10 bestandsnaam
OLD_IFS="$IFS"
IFS=$'\n'
cutme=false


regex="-c([0-9]+)-([0-9]+)"
if [[ $@ =~ $regex ]]
then
echo ja

van=${BASH_REMATCH[1]}
van=$(($van-1))
tot=${BASH_REMATCH[2]}
lengte=$(($tot-$van))
cutme=true
echo $van
echo $tot
else exit 1
fi 

shift
for lijn in `cat "$@"`
do
if [ $cutme = true  ]
then lijn=${lijn:$van:$lengte}
fi
echo $lijn
done

IFS=$OLD_IFS


