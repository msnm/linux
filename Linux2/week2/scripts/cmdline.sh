#!/bin/bash
#Author: msnm
#Createdon: So Mai 20 14:31:17 CEST 2018
#Purpose of cmdline:

path="/proc/*/cmdline"

for cmd in $(ls $path)
do
  find  $cmd -size +0M 2>/dev/null
  if [[ $? -eq 0 ]] && [[ -f $cmd ]] ; then
      grep -aH sbin $cmd
  fi
done


