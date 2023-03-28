FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install mariadb-server -y

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf


