#!/bin/bash
#Author: msnm
#Createdon: Mo Mai 21 16:10:19 CEST 2018
#Purpose of autologin:
port="22"
tmpexpect="expect.sh"

error_geen_ssh="Het programma ssh is nodig. Installeren kan met sudo apt-get install openssh-client"
error_geen_expect="Het programma expect is nodig. Installeren kan met sudo apt-get install expect"
error_usage="Usage: `basename $0` hostname username password"
error_url="De host is niet bereikbaar"

# foutmelding schrijven
function foutmelding () {
echo $1 >&2
exit 1
 }

# Nakijken of alle argumenten werden meegegeven
function usage () {
if [ -z "$3" ]; then foutmelding "$error_usage";
else
   echo Automatic login at $1
   host=$1
fi }


function echotest () {
echo "ok"
}

# Kijk met nc na of ssh draait -> ok => tekst, kan ook met $?
function url () {
nc -w 1 $host $port 2>/dev/null >/dev/null
if [ $? -ne 0 ]; then
echo $error_url>&2 && exit 1
#else echo urlok
fi
}

# Nakijken of ssh en expect geinstalleerd zijn
function sshexpect () {

command -v ssh >/dev/null 2> /dev/null  || { echo >&2 foutmelding "$error_geen_ssh" ; exit 1; }
command -v expect >/dev/null 2> /dev/null || { echo >&2 foutmelding "$error_geen_expect" ;  exit 1; }
echo 'ok'
}

usage $1 $2 $3

echo $host
echotest
url
sshexpect

#nog niet omgezet in functie
# Schrijven van een expect script
echo '#!/usr/bin/expect -f' > $tmpexpect
echo 'set timeout 20' >> $tmpexpect
echo "spawn ssh -o \"StrictHostKeyChecking no\" $2@$1" >> $tmpexpect
echo 'expect "*assword:*"'  >> $tmpexpect
echo "send $3\r">> $tmpexpect
echo "interact" >> $tmpexpect
echo "exit" >> $tmpexpect
chmod +x $tmpexpect

# Opstarten expect script en daarna verwijderen
./$tmpexpect
rm -f $tmpexpec


