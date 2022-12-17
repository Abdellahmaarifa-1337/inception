FROM debian:buster


RUN apt update

RUN echo 'root:root' | chpasswd

RUN apt -y install lsb-release apt-transport-https ca-certificates wget
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
RUN apt update -y

RUN apt install php8.1 php8.1-fpm -y
RUN apt install php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-redis php8.1-intl -y


RUN service php8.1-fpm start
RUN mkdir -p /var/www/html
RUN wget www.wordpress.org/latest
RUN tar --wildcards -xf latest -C /var/www/html --strip-components=1 wordpress/*

RUN chown -R root:root  /var/www/html
RUN chmod -R 777 /var/www/html

#config wp_config.php 
RUN rm /var/www/html/wp-config-sample.php
COPY ./conf/wp-config.php /var/www/html/
COPY ./conf/www.conf /etc/php/8.1/fpm/pool.d/www.conf
# automate instalation
COPY  ./tools/wp.sh /wp.sh
RUN chmod +x /wp.sh
ENTRYPOINT [ "/wp.sh" ]
#CMD ["php-fpm8.1", "-F"]



