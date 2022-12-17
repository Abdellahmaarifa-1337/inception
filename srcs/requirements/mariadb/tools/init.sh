#!/bin/bash

# Set the username and password for the new user
DB="wp"
USERNAME="wp"
PASSWORD="secret"

service mysql start
# Set the host from which the user can connect (e.g. localhost)
HOST='%'
echo 'root:root' | chpasswd
mariadb -e -uroot -proot "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;"
mariadb -e "CREATE DATABASE $DB;"

# import database
#mysql ${DB} < /tmp/wp.sql

# mariadb -uroot -e "ALTER USER 'root'@'127.0.0.1' IDENTIFIED BY 'secret';"
mariadb  -e "CREATE USER '$USERNAME'@'$HOST' IDENTIFIED BY '$PASSWORD';"

# # Grant the user privileges on all databases and tables
mariadb  -e "GRANT ALL PRIVILEGES ON $DB.* TO '$USERNAME'@'$HOST';"

mariadb  -e "FLUSH PRIVILEGES;"



#export MYSQL_DATABASE=55555 MYSQL_USER=$USERNAME MYSQL_PASSWORD=$PASSWORD