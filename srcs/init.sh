#!/bin/bash

service php7.3-fpm start
service nginx start
service mysql start

echo "CREATE DATABASE Jmogo;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON Jmogo.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "UPDATE mysql.user SET PLUGIN='' WHERE user='root';" | mysql -u root --skip-password

bash
