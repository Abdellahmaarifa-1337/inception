#!bin/bash


apt-get -y install openssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -config ssl.conf \
-keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

#nginx -g daemon off;
