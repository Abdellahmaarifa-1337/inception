FROM debian:buster

RUN apt update

#RUN apt update
#10.10.2
RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN apt -y update
RUN apt -y install curl software-properties-common gnupg2
RUN apt -y upgrade
RUN apt update && apt -y full-upgrade
RUN curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
RUN bash mariadb_repo_setup --mariadb-server-version=10.10.2
RUN apt -y update
RUN apt -y install mariadb-server mariadb-client 

#RUN apt install mariadb-server mariadb-client -y
RUN service mariadb start

#RUN /etc/init.d/mysql start
COPY ./tools/init.sh /db/tools/init.sh
RUN chmod +x /db/tools/init.sh
COPY ./my.conf /etc/mysql/my.cnf
COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN ./db/tools/init.sh
EXPOSE 3306
CMD ["mariadbd", "--user=root"]
