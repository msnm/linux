#!/bin/bash
#Author: msnm
#Createdon: So Mai 20 13:02:08 CEST 2018
#Purpose of createScript.sh:

path=$(which ab)
url=$1
if ! [[ -e $path ]]; then
  echo "Het programma ab is nodig. Installeren kan met sudo apt-get install apche2-utils"
  exit 1
fi

if [[ -z $1  ]]; then
  url="127.0.0.1"
fi

curl -ss $url >/dev/null
if [[ $? -ne 0  ]]; then
  echo "De url $url is niet bereikbaar"
  exit 2
fi

sudo service apache2 start
ab -n 100 -kc 10 "$url/"
./apachetest $url
