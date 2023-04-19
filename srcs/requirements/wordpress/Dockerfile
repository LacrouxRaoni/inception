FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl wget mariadb-client -y

RUN mkdir -p /run/php

COPY tools/wp_conf.sh /tmp/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/wordpress/

## BONUS
RUN apt install php7.3-redis -y

RUN echo "env[REDIS_HOST] = redis" >>/etc/php/7.3/fpm/pool.d/www.conf
RUN echo "env[REDIS_PORT] = 6379" >>/etc/php/7.3/fpm/pool.d/www.conf


EXPOSE 9000

ENTRYPOINT ["/bin/sh", "/tmp/wp_conf.sh"]