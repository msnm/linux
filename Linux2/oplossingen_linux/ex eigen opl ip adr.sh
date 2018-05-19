#!/bin/bash


echo "Dit is het script van Behets Kristel."


function windows_formaat () {
win_formaat=${1//:/-}
echo $win_formaat
}
regex="^([0-9]{1}:) (.*):.* ([A-Z]+) group"
#regex="^([0-9]{1}: )([0-9]{2}.[0-9]{2}.[0-9]{2}.[0-9]{2}.[0-9]{2}[0-9])"

IFS=$'\n'
for line in `ip address`
do if [[ $line =~ $regex ]]
then
echo "The state of interface ${BASH_REMATCH[2]} is ${BASH_REMATCH[3]}"
fi
done

#test=`windows_formaat 88:88:88`
#echo $test

