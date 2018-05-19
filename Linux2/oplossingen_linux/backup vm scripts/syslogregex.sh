#!/bin/bash
#velden uit /var/log/syslog weglaten en dan sorteren en nr unieke lijnen

tmpfile="`basename $0`.tmp"
regex="(.* .* .* )(.*)(\[[[0-9]{1,5}\]:)(.*)" #je kan ook enkel de groepen
#die je nodig hebt tussen () zetten
IFS=$'\n'

rm -f "$tmpfile" 2>/dev/null

for lijn in `cat /var/log/syslog`
do
if [[ $lijn =~ $regex ]]
then echo "${BASH_REMATCH[2]} ${BASH_REMATCH[4]}" >> "$tmpfile"
fi
done

cat "$tmpfile" | sort | uniq -c | sort -g | grep -v info 
#toon regels waar info niet in voorkomt