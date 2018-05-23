#!/bin/bash
#Author: msnm
#Createdon: Di Mai 22 20:59:30 CEST 2018
#Purpose of cutspace:

if ! [[ -d tmp ]]; then
  mkdir tmp
fi

for i in {1..10}; do
  touch "tmp/file $RANDOM.random"
done

IFS=$'\n'
echo "Filenames with spaces"
find * -iname "*.random"

for file in $(ls tmp); do
  if [[ -f $file ]]; then
    echo "$file is a file"
  fi
  name=${file//' '/"_"}
  echo "new name is $name"
  mv -v ${file//' '/"\\ "} ${name}
done

echo "Filenames with underscores spaces"
find * -iname "*.random"
#rm -r tmp/*
unset IFS
