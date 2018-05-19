#/bin/bash
# script dat aantal lijnen telt: wc emulator

teller=0

IFS=$'\n'

for lijn in `cat $1`
do let teller+=1
done

echo "`basename $0` $1"
echo "${teller} $1"

 
