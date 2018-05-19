 #!/bin/bash 
# zoeken in apache configuratiebestand naar een keyword dat wordt opgegeven als 
# eerste argument

adir="/etc/apache2"
confs="$adir/apache2.conf $adir/pports.conf"

if [ $# -lt 1 ] 
then echo "geen argument ingegeven"
exit 1
fi

IFS=$' '
for bestand in $confs 
do 
if [ -f $bestand ]
then grep -iHn "$1" "$bestand"

# else echo "${bestand} bestaat niet" 
# script moet gewoon doorlopen zonder foutmelding
 
fi
done
