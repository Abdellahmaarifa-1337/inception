#!/bin/bash

#service php8.1-fpm start
#
# apt install curl -y
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp
#su -u www-data
mkdir -p /var/www/html &&\
wp core download --path=/var/www/html --allow-root  &&\
chown -R root:root  /var/www/html &&\
chmod -R 777 /var/www/html &&\

#touch /var/www/html/wp-config.php
wp config create --path=/var/www/html --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --allow-root --force
if ! wp core is-installed --path=/var/www/html --allow-root; then
	wp core install --url=${WORDPRESS_SITE_URL} --path=/var/www/html --title=${WORDPRESS_SITE_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root
	wp user create ${WORDPRESS_USER_NAME} ${WORDPRESS_USER_EMAIL} --role=${WORDPRESS_USER_ROLE} --user_pass=${WORDPRESS_USER_PASSWORD} --path=/var/www/html --allow-root
fi
php-fpm8.1 -F