#!/bin/bash
#kleuren kolommen via funktie: tonen van een argument in kleur

reset='\e[0m'
rood='\e[0;31m'
blauw='\e[0;34m'

#regex="([0-9]{1,4}) (.* ).*" 
#regex groups is moeilijk als niet alle lijnen zelfde herkenningspunten hebben

IFS=$'\n'

function tooninkleur() {
shopt -q -s extglob
proces=${1##*([[:space:]])}
shopt -q -u extglob
echo -e "$rood ${proces/ /$reset $blauw} $reset"
}

for lijn in `ps -eo pid,args`
do
tooninkleur $lijn
done
