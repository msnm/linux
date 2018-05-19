#!/bin/bash
# opstarten van een proces als een regelmatig achtergrondproces

if [ "$(id -u)" != "0" ]; then
echo "Dit script moet je als root uitvoeren"
1>&2
exit 1
fi

if [ $# -lt 1 ] ; 
then
echo "Usage: argument meegeven"
exit 1
fi

if [ "$1" = "--help" -o "$1" = "-h" ]  
then
echo "Usage: helpboodschap uit opgave hier weer te geven"
exit 1
fi

if [ "$1" = "--remove" ]
then
	if [ -f "/etc/cron.d/${2}.cron" ]
	then rm "/etc/cron.d/${2}.cron"
	exit 0
	else echo "kan file niet verwijderen, file bestaat niet"
	exit 1
	fi
fi

if ! [ -r $1 -a -x $1 ]
then echo "geen uitvoerbaar bestand"
exit 1
else echo "***** root ${1}" > /etc/cron.d/${1}.cron
#niet gecheckt of die cron file iets doet
fi