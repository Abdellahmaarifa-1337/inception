#!/bin/bash

HOST='%'

service mysql start

mariadb -uroot -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;"

mariadb -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${MYSQL_DATABASE};"

mariadb  -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER '${MYSQL_USER}'@'$HOST' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mariadb  -uroot -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'$HOST';"

mariadb  -uroot -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

service mysql restart


