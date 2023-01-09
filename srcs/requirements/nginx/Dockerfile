FROM debian:buster

RUN apt update -y && apt install -y nginx

COPY ./conf/amaarifa.config /etc/nginx/sites-enabled/amaarifa.config

COPY ./conf/ninom.config /etc/nginx/sites-enabled/ninom.config

COPY ./tools/ssl.sh /ssl.sh

COPY ./conf/ssl.conf .

RUN chmod +x /ssl.sh && ./ssl.sh

CMD ["nginx", "-g", "daemon off;"]