#!/bin/bash
# omzetten bestandsnamen met spatie naar bestandsnamen zonder spatie

for i in {1..10}
do
touch "$RANDOM $RANDOM    $RANDOM"
done

IFS=$'\n'
for lijn in `ls $1`
do
echo ${lijn//' '}
done


