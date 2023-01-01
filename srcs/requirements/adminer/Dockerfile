FROM debian:buster

RUN apt update && apt install apache2 php \
	libapache2-mod-php php-curl php-cli php-mysql \
	php-gd mariadb-server -y

RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php -y

RUN chown -R www-data:www-data /var/www/html/adminer.php

RUN  chmod 755 /var/www/html/adminer.php

