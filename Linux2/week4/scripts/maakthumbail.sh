#!/bin/bash
#Author: msnm
#Createdon: Mi Mai 23 18:44:55 CEST 2018
#Purpose of maakthumbail:

function convertTopng() {
  convert -thumbnail 50x50 -extent 50x50 -gravity center ${1} ${2}
}

IFS=$'\n'

for image in $(find -maxdepth 4 -iname "*.jpg"); do
  newnamenowhitespace=${image//' '/"_"} #whitespace vervangen door
  jpgTopng=${newnamenowhitespace/%jpg/png}
  convertTopng ${image} ${jpgTopng}
if [[ $? -eq 0 ]]; then
  echo "Bestand is omgezet van $image to $jpgTopng"
fi
done

unset IFS


