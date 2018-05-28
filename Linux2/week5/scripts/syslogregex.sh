#!/bin/bash
#=========================================================
#Author: Michael Schoenmaekers
#Createdon: Mo Mai 28 19:09:26 CEST 2018
#Version: 1.0
#Purpose of syslogregex:
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
#=========================================================

IFS=$'\n'
a=[[:alpha:]]
d=[[:digit:]]
rm -f tmp.txt
regex="([[:alpha:]]{3} [ 0-9]{2})"

#regex="$a{3} [ 0-9]$d $d{2}:$d{2}:$d{2} `hostname` (.*)\[$d+\]: (.*)"
for line in $(cat /var/log/syslog); do
  if [[ $line =~ $regex ]]; then
      echo "Something: ${BASH_REMATCH[1]}" >> tmp.txt
  fi

done
unset IFS
