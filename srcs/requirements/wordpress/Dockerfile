FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install php7.3-fpm -y

RUN mkdir -p /run/php

RUN rm /etc/php/7.3/fpm/php.ini

COPY tools/php.ini /etc/php/7.3/fpm/

CMD ["php-fpm7.3", "-F"]