#!/bin/bash
# commando="/bin/df" en die var verder gebruiken in de if
mess_niet_uitv="Het bestand /bin/df is niet uitvoerbaar."
mess_bestaat_niet="/bin/bf bestaat niet"
if ! [ -s /bin/df  ] 
# of -e ipv -s
then echo "$mess_bestaat_niet"
exit 1
fi
# else is niet nodig als je na eerste if exit code voorziet bij fout
# resterend stuk moet dus niet in geneste if onder else

if ! [ -r /bin/df -a -x /bin/df ]
then echo "$mess_niet_uitv"
exit 2
else df -h
fi   

exit 0

