#!/bin/bash
#=========================================================
#Author: Michael Schoenmaekers
#Createdon: Mo Mai 28 21:27:10 CEST 2018
#Version: 1.0
#Purpose of poortenregex:
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
## reset=\'\e[0m'  rood='\e[0;31m' blauw='\e[0;34m'
##   shopt -q -s extglob content=${content##*([[:space:]])}   shopt -q -u extglob
#=========================================================

echo "TCP poorten:"
IFS=$'\n'
regex="tcp.*:+([1-9]+).*LISTEN"
for line in $(netstat -tulpn 2>/dev/null); do
if [[ $line =~ $regex ]]; then
  echo ${BASH_REMATCH[1]}
fi
done
unset IFS
