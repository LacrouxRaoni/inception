FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
    apt-get install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl wget mariadb-client -y && \
    mkdir -p /run/php && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    sed -i 's/listen = .*/listen = 0.0.0.0:9000/' /etc/php/7.3/fpm/pool.d/www.conf

COPY tools/wp_conf.sh /tmp/

## BONUS
RUN apt-get install php7.3-redis -y && \
    echo "env[REDIS_HOST] = redis" >>/etc/php/7.3/fpm/pool.d/www.conf && \
    echo "env[REDIS_PORT] = 6379" >>/etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/wordpress/

EXPOSE 9000

ENTRYPOINT ["/bin/sh", "/tmp/wp_conf.sh"]