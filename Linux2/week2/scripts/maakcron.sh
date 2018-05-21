#!/bin/bash
#Author: msnm
#Createdon: So Mai 20 21:17:33 CEST 2018
#Purpose of maakcron: voert elke minuut een bepaald commando uit
errorRoot="Start the script as root!"
errorNoArg="Please type $(basename $0) -h or $(basename $0) --help for more information"
errorArg="One argument needs to be specified. The argument should be a executable file"
helpMessage="Usage: sudo $(basename $0) [--remove] exucatable file \n
--remove     Remove cron file\n
--help or -h Display this help message"
#Check if user is logged on as root
if ! [[ $(id -u) -eq 0 ]]; then
  echo $errorRoot
  echo $errorNoArg
  exit 1;
fi

#Check if at least one argument is specified.
if ! [[ $# -ge 1 ]]; then
  echo $errorNoArg
  exit 1;
fi

#When help option specified
if [[  $1 = '--help' || $1 = '-h' ]]; then
  echo -e $helpMessage
  exit 1
fi

if [[ $1 = '--remove' ]]; then
  if [[ -f "/etc/cron.d/${2}.cron" ]]; then
    sudo rm -f "/etc/cron.d/${2}.cron"
    if [[ $? -eq 0 ]]; then
      echo "Removed succesfully $2"
    else "Remove failed of $2"
    fi
  else "$1 does not exist, so it cannot be removed"
    exit 1
  fi
  exit 0
fi


if [[ -r $1  && -x $1 ]] ; then
  echo "creating chron $1"
  bestand="/etc/cron.d/${1}.cron"
  touch $bestand
  if ! [[ $? -eq 0 ]]; then
    echo "Could not create file $bestand" >2$
    exit 1
  fi
  echo "# Minute Hour Day_of_Month Month Day of Week User Command" >> ${bestand}
  echo "# (0-59) (0-23)  (1-31)    (1-12)  (0-6)" >> ${bestand}
  echo "***** root ${1}"  >> ${bestand}
  exit 0
else
  echo $errorArg
  exit 1
fi
