#!/bin/bash
#Author: msnm
#Createdon: Mo Mai 21 16:18:41 CEST 2018
#Purpose of netcat:
error_geen_nc="Netcat niet geïnstalleerd."

if [ "$(id -u)" != "0" ]; then
echo "Dit script moet je als root uitvoeren"
1>&2
exit 1
fi

command -v nc >/dev/null || (echo $error_geen_nc >&2 && exit 1)

nc -l 13
# dit start met netcat een luisterende poort op poort 13

for teller in {1..100}
do
lsof -nPi tcp:${teller} | grep -i "listen"
done
