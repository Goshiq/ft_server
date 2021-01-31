#!/bin/bash
FILE=$(cat /etc/nginx/sites-available/localhost)
SRCH='autoindex on'
if [[ $FILE = *$SRCH* ]]
then
	sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/localhost
	echo "autoindex off"
else
	sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/localhost
	echo "autoindex on"
fi
service nginx restart
