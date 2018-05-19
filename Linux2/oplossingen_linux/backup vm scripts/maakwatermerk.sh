#!/bin/bash
# omzetten jpg bestanden naar thumbnail png bestanden

IFS=$'\n' #zorgt ervoor dat het ook werkt voor bestanden met spaties in de naam
dir=`pwd`

function download () {
if ! [ -f Logo_V.png ]
then
`wget https://www.kdg.be/doc/huisstijl/Logo_V.png`
else 
echo "al gedownload"
fi
watermerk="Logo_V.png"
echo $watermerk
 }

function maak_watermerk {
doelbestand=${1//jpg/png}
composite -compose bumpmap -tile ${watermerk} ${1}  ${doelbestand}
}

download

for bestand in `find $dir  -iname "*.jpg"` 
do maak_watermerk $bestand

done

