FROM debian:buster




RUN apt update &&\
	 groupadd -r mysql && useradd -r -g mysql mysql &&\
	 apt -y update &&\
	 apt -y install mariadb-server mariadb-client 
#RUN service mariadb start
COPY ./conf/my.conf /etc/mysql/my.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/wp.sql /tmp

COPY ./tools/init.sh /db/tools/init.sh

RUN chmod +x /db/tools/init.sh && ./db/tools/init.sh

CMD ["mysqld", "--user=root"]
