#!/bin/bash
#=========================================================
#Author: Michael Schoenmaekers
#Createdon: Mo Mai 28 20:57:49 CEST 2018
#Version: 1.0
#Purpose of kleur:
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
reset='\e[0m'    # Vergeet NIET te resetten of alles blijft gekleurd!
rood='\e[0;31m'
blauw='\e[0;34m'

echo -e "$rood rood $reset"
echo -e "$blauw blauw $reset"
IFS=$'\n'

function tooninkleur() {
  shopt -q -s extglob
  # enkel 1 leading space  proces=${1/# /}
  proces=${1##*([[:space:]])}
  echo "Proces: $proces"
  shopt -q -u extglob
  echo -e "$rood ${proces/ /$reset $blauw} $reset"
}


for proces in `ps -eo pid,args`
do
  tooninkleur $proces
done
