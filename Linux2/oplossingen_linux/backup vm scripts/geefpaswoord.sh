#!/bin/bash
# nakijken van een input string

paswoord="a"

echo "Geef het paswoord:"
read -s -p "Paswoord:" mogelijkpaswoord

if [ $paswoord = $mogelijkpaswoord ]
then echo Toegelaten
else echo Verboden
fi
