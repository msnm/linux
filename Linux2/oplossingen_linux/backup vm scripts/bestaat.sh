#!/bin/bash
mess_error="Het bestand /bin/df is niet uitvoerbaar."

if [ -x /bin/df  ] 
then df -h
else echo "$mess_error"
exit 1
fi
