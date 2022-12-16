FROM debian:buster


RUN apt update

RUN echo 'root:root' | chpasswd

RUN apt -y install lsb-release apt-transport-https ca-certificates wget
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN apt update -y

RUN apt install php8.1 php8.1-fpm -y
RUN apt install php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-redis php8.1-intl -y
EXPOSE 9000:9000


RUN service php8.1-fpm start
RUN mkdir -p /var/www/html
RUN wget www.wordpress.org/latest
RUN tar --wildcards -xf latest -C /var/www/html --strip-components=1 wordpress/*

RUN chown -R root:root  /var/www/html
RUN chmod -R 777 /var/www/html

#config wp_config.php 
RUN rm /var/www/html/wp-config-sample.php
COPY $PWD/wp-config.php /var/www/html/

# install wp

RUN apt install curl -y
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# automate instalation
COPY  /tools/wp.sh /wp.sh
RUN chmod +x /wp.sh
RUN bash /wp.sh

CMD ["php-fpm8.1", "-F"]
#RUN curl localhost > /ts/res.txt

#RUN wp core install --url=localhost --path=/var/www/html --title=hello_world --admin_user=root --admin_password=root --admin_email=root@42.com --allow-root


#CMD ["php", "-S", "0.0.0.0:9000"]
# FROM php:8.1-fpm


