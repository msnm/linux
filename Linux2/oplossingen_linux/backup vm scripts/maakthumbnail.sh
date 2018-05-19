#!/bin/bash
# omzetten jpg bestanden naar thumbnail png bestanden

function maak_thumbnail () {
convert -thumbnail 50x50 -extent 50x50 -gravity center ${1} ${2}
}

IFS=$'\n' #zorgt er voor dat het ook werkt voor bestanden met spaties in de naam
dir=`pwd`

for bestand in `find $dir -name "*.jpg"` 
do
naam="`basename $bestand`"
naamzonderspaties=${naam//' '/'_'} #niet nodig zie hierboven
naamthumb=thumbnail_${naamzonderspaties/%jpg/png}
maak_thumbnail $bestand $naamthumb
if [ $? -eq 0 ] 
then echo $naam omgezet naar $naamthumb
fi
done