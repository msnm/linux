#!/bin/bash
#=========================================================
#Author: Michael Schoenmaekers
#Createdon: So Mai 27 19:10:54 CEST 2018
#Version: 1.0
#Purpose of poorten:
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

echo "TCP poorten:"
IFS=$'\n'
for line in $(netstat -tulpn 2>/dev/null); do
  var=$(echo $line | grep LISTEN ) 2>/dev/null
  if [[ $? -eq 0 ]]; then
    var=${line#*:}
    var=${var/' '/_}
    var=${var%%_*}
    var=${var##:*:}
    echo $var
  fi
done
unset IFS
