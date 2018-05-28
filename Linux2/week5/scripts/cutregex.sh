#!/bin/bash
#=========================================================
#Author: Michael Schoenmaekers
#Createdon: Mo Mai 28 20:25:45 CEST 2018
#Version: 1.0
#Purpose of cutregex:
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
## $@ in combi met SHIFT als een script schrijft met ./script optie1 file1 file2 ...
## Regex:[[:alpha:]] [[:digit:]] [[:space:]] [[:alnum:]] [[:print:]]
#=========================================================

cutme=false
eerste=$1
echo eerste arg $1
shift
regex="(-c)([[:digit:]])-([[:digit:]])"
if [[ $eerste =~ $regex ]]; then
  cutme=true
  van=$((${BASH_REMATCH[2]} -1))
  tot=$((${BASH_REMATCH[3]}-1))
  lengte=$(($tot-$van))
  echo $lengte
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
