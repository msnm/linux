#!/bin/bash
#parameter servername

regex=".*ServerName (.*)" 
IFS=$'\n'
bestaat=false

for lijn in `cat /etc/apache2/apache2.conf`
do

if [[ $lijn =~ $regex ]]
then echo ${BASH_REMATCH[1]}
bestaat=true
fi
done 

echo $bestaat
 

 
[ $bestaat = false ]
sudo su -

#ok is al een keer uitgevoerd, moet zeker niet in loop!
#sudo chmod +w /etc/apache2/apache2.conf

sudo echo "ServerName laptopKB" >> /etc/apache2/apache2.conf