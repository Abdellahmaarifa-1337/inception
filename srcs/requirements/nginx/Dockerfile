FROM debian:buster

RUN apt update

RUN apt install -y nginx

RUN chown -R root:root  /var/www/html

RUN chmod -R 777 /var/www/html

COPY ./conf/default /etc/nginx/sites-enabled/default

COPY ./conf/ninom.config /etc/nginx/sites-enabled/ninom.config
COPY ./tools/ssl.sh /ssl.sh
COPY ./conf/ssl.conf .
RUN chmod +x /ssl.sh && ./ssl.sh
#ENTRYPOINT [ "bash", "/ssl.sh" ]
CMD ["nginx", "-g", "daemon off;"]