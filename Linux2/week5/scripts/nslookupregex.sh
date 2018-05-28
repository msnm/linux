#!/bin/bash
#=========================================================
#Author: Michael Schoenmaekers
#Createdon: Mo Mai 28 21:51:33 CEST 2018
#Version: 1.0
#Purpose of nslookupregex:
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

function fun_nslookup() {
  name=$(nslookup $1 2>/dev/null)
  regex=".*= (.*)Aut"
  [[ $name =~ $regex ]]
  echo ${BASH_REMATCH[1]}
}
inputfile="ips.txt"
echo "109.74.196.225" > ips.txt
echo "91.189.90.40" >> ips.txt
echo "173.194.34.168" >> ips.txt

for  line in $(cat $inputfile); do
  fun_nslookup $line
done
exit 0
