#!/bin/bash
#=========================================================
#Author: Michael Schoenmaekers
#Createdon: Di Mai 29 17:46:46 CEST 2018
#Version: 1.0
#Purpose of rondetijden:  Calculates the average time of rounds
#Arguments: ARG1: textfile
#Requires: rondetijden.txt
#=========================================================
echo -e "Script van: Schoenmaekers Michael \n \n"

error_file_not_exist="ERROR $(basename ${0}): The file ${1} does not exist."
error_empty_file="ERROR $(basename ${0}): The file ${1} is empty! Put content in. "
error_no_root="ERROR $(basename ${0}): This script cannot be executed as root!"
message_usage="Usage: $(basename $0) \n Arg1 moet een text file zijn.
\n Deze textfile moet regels bevatten geformateerd volgens: DeelnemerNAAMUurGETALMinutenGETAL.
\n NAAM en GETAL zijn zelf in te vullen. NAAM mag zowel uit cijfers als letters bestaan.
\n Example: ./rondetijden.sh rondetijden.txt"

#This function calculates the average time
function gemiddelde_rondetijd () {
  tijd=$( echo "scale=2; $1/$2" | bc )
  uur=$(echo "scale=0; $tijd/60" | bc)
  min=$(echo "scale=2; $tijd-$uur*60" | bc)
  echo "${uur} uur ${min} min"
}

#Check if this is not the root user
if [[ $(id -u) -eq 0 ]]; then
  echo ${error_no_root}
  exit 1
fi

#Validating input arguments
if [[ $# -ne 1 || $1 = '-h' || $1 = '--help'  ]]; then
  echo -e ${message_usage}
  exit 1
fi

#The input file should exist and should hava a size greater then zero
if ! [[ -f $1 ]]; then
  echo ${error_file_not_exist} >&2
  exit 1
else
  if [[ -z $1 ]]; then
    echo ${error_empty_file} >&2
    exit 1
  fi
fi

#Start of the main program
IFS=$'\n'
regex="^Deelnemer([[:alnum:]]+)Uur([[:digit:]]{1,2})Minuten([[:digit:]]{1,2})$" #DeelnemerPeter2uur2Minuten55
for line in $(cat $1); do
  if [[ $line =~ $regex ]]; then
    uren=$((uren + ${BASH_REMATCH[2]} ))
    minuten=$((minuten + ${BASH_REMATCH[3]} ))
    aantal=$((aantal + 1))
    echo "Ronde OK voor: ${BASH_REMATCH[1]}"
  fi
done
echo "Totaal: ${uren} uur ${minuten} minuten"
echo "Gemiddeld $(gemiddelde_rondetijd $((${uren}*60 + ${minuten})) ${aantal})"
unset IFS

echo -e "\n \nSchoenmaekers Michael "
exit 0
