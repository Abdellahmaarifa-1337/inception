FROM debian:buster

ARG MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=${MYSQL_DATABASE} MYSQL_USER=${MYSQL_USER} \
        MYSQL_PASSWORD=${MYSQL_PASSWORD} MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

RUN apt update &&\
         groupadd -r mysql && useradd -r -g mysql mysql &&\
         apt -y update &&\
         apt -y install mariadb-server mariadb-client 


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


COPY ./tools/init.sh /db/tools/init.sh

RUN chmod +x /db/tools/init.sh
RUN ./db/tools/init.sh
USER mysql
CMD ["mysqld"]