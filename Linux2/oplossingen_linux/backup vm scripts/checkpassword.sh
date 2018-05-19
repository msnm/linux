#!/bin/bash
#check of paswoord voldoet aan voorwaarden

regex="^[A-Z][[:print:]]{5}[[:print:]]*[0-9]{2}$"
echo "Geef paswoord in:"
read paswoord
echo $paswoord
if [[ $paswoord =~ $regex ]]
	then echo "Paswoord geldig"
	else echo "Paswoord ongeldig"
fi

