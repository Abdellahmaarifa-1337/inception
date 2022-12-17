#!/bin/bash

#service php8.1-fpm start
#
apt install curl -y
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
#su -u www-data
wp core install --url=amaarifa.com --path=/var/www/html --title=hello_world --admin_user=root --admin_password=root --admin_email=root@42.com --allow-root
php-fpm8.1 -F