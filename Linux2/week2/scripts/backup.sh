#!/bin/bash
#Author: msnm
#Createdon: So Mai 20 15:12:42 CEST 2018
#Purpose of bachp:

homedir="~"
error_dir="One argument - a dir - should be specified. $1 is not a known dir"
error_root="You need to run this script as root"
errorlog="error_$(basename $0).log"
backuplog="b_$(basename $0).log"
filename="Backup_$(date +%Y_%m_%d_%H_%M_%S).tar"


#Check if one argument is specified and is a dir
if [[ -n $1 ]]; then
  if [[ -d $1 ]]; then
    homedir=$1
  else
    echo $error_dir >>${errorlog}
  fi
fi

if [[ $(id -u) -ne 0 ]] ; then
  echo $error_root >>${errorlog}
  exit 1
fi

# -czvf makes a new tar for each file, therefore only the last file is in the tar!!!
#find $dir -iname "*.sh" -mtime +48 -exec  tar -czvf $filename {} \; #backup all files modified less then two days ago

#We need to append files to the tar file us the -r option!
find $dir -iname "*.sh" -mtime -24 -exec  tar -rvf $filename {} \;  >>"${backuplog}" 2>>"${errorlog}"


