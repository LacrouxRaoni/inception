FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install mariadb-server -y

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/db_conf.sh /tmp

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod +x tmp/db_conf.sh

ENTRYPOINT ["/bin/sh", "/tmp/db_conf.sh"]