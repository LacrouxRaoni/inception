FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y && \
    rm /etc/mysql/mariadb.conf.d/50-server.cnf

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/db_conf.sh /tmp

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf && \
    chmod +x tmp/db_conf.sh

EXPOSE 3306

ENTRYPOINT ["/bin/sh", "/tmp/db_conf.sh"]