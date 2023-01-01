FROM debian:buster

RUN apt update

RUN apt install -y nginx
RUN mkdir -p /var/www/html/
RUN chown -R root:root  /var/www/html/

RUN chmod -R 777 /var/www/html/


COPY ./ninom /var/www/html
COPY ./conf/default /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]