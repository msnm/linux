#!/bin/bash
#=========================================================
#Author: Michael Schoenmaekers
#Createdon: So Mai 27 18:54:02 CEST 2018
#Version: 1.0
#Purpose of cut:
#Toolset:
## Check if command is installed: command -v ab >/dev/null 2>&1 || { echo "Error" >&2; exit 1 }
## Default Value: ${var:-default}
## Error Value: ${var?error_message}
## Replace: ${string/vervang_deze_string/door_deze_string}
### Replace all: ${string//vervang_deze_string/door_deze_string}
## Replace begin or end: ${string/#vervang_deze_string/door_deze_string} or ${string/%vervang_deze_string/door_deze_string}
## Substring: ${string:positie:lengte}
## Trim: {string#a*b} {string##a*b} {string%a*b} {string%%a*b}
## Lower upper count:  ${string,,} ${string^^}  ${#string}
#=========================================================

cutme=false
eerste=$1
echo eerste arg $1
shift
optie=${eerste:0:2}
if [ $optie = "-c" ]; then
  cutme=true
  van=${eerste#-c}; van=${van%-*}; van=$(($van-1))
  tot=${eerste##*-}
  lengte=$(($tot-$van))
fi

OLDIFS=$IFS
IFS=$'\n'
for lijn in `cat "$@"`
do
  if $cutme
    then
    lijn=${lijn:$van:$lengte}
  fi
    echo $lijn
done
IFS=$OLDIFS
#unset IFS
