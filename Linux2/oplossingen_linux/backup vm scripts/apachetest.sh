*#!/bin/bash
#benchmark test(=ab) voor apache webverser oproepen
error_urlnietok="De url is niet bereikbaar."
error_geen_ab="Het programma ab is nodig. Installeren kan met apt-get install apache2-utils."
url="127.0.0.1/"

command -v ab >/dev/null || (echo $error_geen_ab >&2 && exit 1) && (

if ! [ $# -lt 1 ] 
then url="$1"
fi

curl -ss $url &>/dev/null && ab -n 100 -kc 10 $url || (echo $error_urlnietok >&2 && exit 2) )


#zie slides H3: alternatieve oplossing
#curl -o /dev/null --silent --head --connect-timeout 1 ${url}
# if [ $? -ne 0 ]; then
#echo ${error_url} && exit 2
#else ab....
#fi

echo "$?"





