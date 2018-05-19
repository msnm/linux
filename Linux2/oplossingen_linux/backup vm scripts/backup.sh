#!/bin/bash
# schrijven van een back up script

path="/home"
backupregex="*.sh"
error_dir="Opstarten met een directory als eerste argument: bv sudo ./`basename $0` /home"
error_root="Opstarten als root gebruiker: bv sudo./`basename $0` /home"
errorlog="/var/log/error_`basename $0`.log"
backuplog="/var/log/backup_`basename $0`.log"


if [ $# -eq 1 ] 
then  if ! [ -d $1 ] 
	then echo $error_dir >&2
	#2>$errorlog geen toegang tot die file als niet ingelogd als root
	exit 1
	else path="$1"
	fi
fi
backupfile="${path}/Backup_`date +'%Y_%m_%d_%H_%M_%S'.tar`"
#niet bovenaan want dan is path nog niet def vastgelegd

if [ "$(id -u)" != "0" ]; then
echo $error_root >&2
#2>$errorlog
exit 1
fi

find ${path} -mtime -5 -iname "${backupregex}" >>${backuplog} -exec tar rPvf ${backupfile} {} \; >> ${backuplog} 2>> ${errorlog}
gzip ${backupfile}
