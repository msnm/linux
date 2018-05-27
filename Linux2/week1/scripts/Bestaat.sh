#!/bin/bash
#Author: msnm
#Createdon: Sa Mai 19 22:14:17 CEST 2018
command=$1

if [[ -e $(which $command) ]] && [[ -r $(which $command) ]] && [[ -x $(which $command) ]]
then
  echo "$command is executable!"
  echo "Path to command is: $(which $command)"
  echo  $($command)
else
  echo "$command is not executable"
fi


