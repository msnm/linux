#!/bin/bash
#Author: msnm
#Createdon: So Mai 20 13:30:41 CEST 2018
#Purpose of createScript.sh:
helpmessage="Usage: $(basename $0) arg 1 arg 2  Example: $(basename $0) /usr/bin 10"
versionmessage="$(basename $0) version 0.1"
path="/"
size=10

if [[ $1 = "--help" ]]; then
  echo $helpmessage
  exit 1
fi

if [[ $1 = "--version" ]]; then
  echo $versionmessage
  exit 1
fi


if [[ $# -eq 1 ]] && [[ $1 = $1 ]]; then
  path=$1
fi

if  [[ $# -eq 2 ]] && [[ $size -eq $size ]]  && [[ $1 = $1 ]]; then
  size=$2
  path=$1
fi

sudo find $path -type f -size "+${size}M" -exec stat -c '%s %n' {} \;


