#!/bin/bash
#Author: msnm
#Createdon: Sa Mai 19 22:30:11 CEST 2018
keyword=$1
adir="/etc/apache2"
confs="$adir/apache2.conf $adir/ports.conf"

if [[ -z $1 ]]; then
  echo "No arguments specified!"
  exit 1
fi

for file in $confs; do
  #grep -H option suppresses the file output name if grep needs to search in more then one file
  #grep -n  Prefix each line of output with the 1-based line number within its input file.
  echo -e "\n$(grep -iH $keyword $file)\n"
done
