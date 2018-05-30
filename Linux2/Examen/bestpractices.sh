#!/bin/bash

# Functie: Geeft passende oplossingen voor een kruiswoordraadsel.
# Arguments: Arg1 is het eerste letter van het woord.
#	Arg 2 is de lengte van het woord.
#	Arg 3 is een letter die op een andere positie staat.
#	Arg 4 is de positie van de letter, gegeven als arg 3.
# Auteur: michael.schoenmaekers@student.kdg.be
# Copyright: 2017 michael.schoenmaekers@student.kdg.be
# Versie: 0.1
# Requires: Standaard shell find cat.
# Requires: Bestand /usr/share/dict/words.

bestand="/usr/share/dict/words"
error_geen_cat="Het commando cat werd niet gevonden."
message_usage="Usage: `basename $0` \n Arg1 is het eerste letter van het woord. \n Arg 2 is de lengte van het woord. \n Arg 3 is een letter die op een andere positie staat. \n Arg 4 is de positie van de letter, gegeven als arg 3.\n Example: ./kruisw.sh c 5 e 2"

if [ "$(id -u)" != "0" ]; then
echo "Dit script moet je als root uitvoeren"
1>&2
exit 1
fi

if ! [ -s "$bestand" ]
then echo "${bestand} werd niet gevonden"
1>&2
exit 2
fi

command -v cat >/dev/null
if [ $? -ne 0 ]
then
echo ${error_geen_cat} >&2 && exit 3
fi

if [ $# -lt 4 -o "$1" = "--help" ]
then
echo -e "$message_usage"
1>&2
exit 1
else

lengte1=$(($4-2))
lengte2=$(($2-$4))
regex="^[${1}][a-z]{${lengte1}}[${3}]([a-z]{${lengte2}})$"
#regex="${1}[a-z]{3}$3{$lengte2}"

echo "Dit is het script van schoenmaekers michael."
echo "I've found these words for you:"

for line in `sudo cat /usr/share/dict/words`
do if [[ $line =~ $regex ]]
then
echo "$line"
fi
done
fi
