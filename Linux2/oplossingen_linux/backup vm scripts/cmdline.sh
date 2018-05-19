#!/bin/bash
# weergeven progrs vanuit sbin gestart
# commentaar toevoegen zie best pratices

#err_bestandleeg: staat niet in de opgaven dat je dit moet laten zien?

for lijn in $(ls /proc/*/cmdline)
do
find $lijn -size +0M 2>/dev/null
if [ $? -eq 0 ] &&  [ -f  $lijn ] 
then grep -a --text -H sbin $lijn
#else 2>/dev/null
fi 
done


