FROM debian:buster

RUN apt update && apt install wget apache2 php \
	libapache2-mod-php php-curl php-cli php-mysql \
	php-gd mariadb-server -y

RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/index.php 

RUN chown -R www-data:www-data /var/www/html/index.php

RUN  chmod 755 /var/www/html/index.php
RUN rm /var/www/html/index.html
#COPY ./conf/httpd.conf /opt/bitnami/apache2/conf/httpd.conf
#EXPOSE 60

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
