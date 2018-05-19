#!/bin/bash
# omzetten van ip adressen naar namen

regex=".*= (.*)Aut"

function fun_nslookup () {
nslookup $1
}

inputfile="ips.txt"
echo "109.74.196.225" > ips.txt
echo "91.189.90.40" >> ips.txt
echo "173.194.34.168" >> ips.txt

for lijn in `cat $inputfile`
do
tekst=`nslookup $lijn`
#echo $tekst
if [[ $tekst =~ $regex ]]
then #echo ok
echo "${BASH_REMATCH[1]}"
fi
done 