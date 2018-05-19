#!/bin/bash
# zoeken naar grote bestanden, help en version implementeren, default argumenten
helpmessage="Usage: $(basename $0) arg 1 arg 2  Example: $(basename $0) /usr/bin 10"
versionmessage="$(basename $0) version 0.1"
pad="/"
grootte=10
#uitvoeren=true

if [ "$1" = "--help" ]
then echo $helpmessage
#uitvoeren=false
exit 1
fi

if [ "$1" = "--version" ]
then echo $versionmessage 
#uitvoeren=false
exit 1
fi

if [ $# -eq 1 ] && [ "$1" != "--help" ] && [  "$1" != "--version" ]
then pad=$1
fi

if [ $# -eq 2 ] && [ "$1" != "--help" ] && [  "$1" != "--version" ]
then pad=$1
grootte=$2
fi
 
#if [ $uitvoeren ] niet nodig: bij exit 1 wordt programma toch meteen verlaten
  sudo find $pad -type f -size "+${grootte}M" -exec stat -c '%s %n' {} \;
#fi

