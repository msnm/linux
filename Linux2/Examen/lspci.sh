#!/bin/bash
#=========================================================
#Author: Michael Schoenmaekers
#Createdon: Di Mai 29 18:48:45 CEST 2018
#Version: 1.0
#Purpose of lspci:
#Arguments: ARG1: lscpi -v
#Requires: The program lscpi should be installed in order to run this script
#=========================================================
reset='\e[0m'
kleur='\e[1;32m'

echo -e "Script van: Schoenmaekers Michael \n"
error_command_not_found="ERROR: $(basename $0) could not find command $1"
command -v $1 -v >/dev/null 2>&1 || { echo ${error_command_not_found} >&2; exit 1; }

IFS=$'\n'
regex_names=".*[[:digit:]][[:space:]]([[:print:]]+):"
regex_memory=".*(Memory.*[[:xdigit:]]{8}).*\[(size=[[:alnum:]]+)\]"
for line in $($1 -v); do
  if [[ $line =~ $regex_names ]]; then
    echo "DEVICE: ${BASH_REMATCH[1]^^}"
  fi
  if [[ $line =~ $regex_memory ]]; then
    if [[ -n ${BASH_REMATCH[2]} ]]; then
      echo -e "Has ${kleur} ${BASH_REMATCH[1]} ${reset}  ${BASH_REMATCH[2]}"
    fi
  fi
done
exit 0
unset IFS
