FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install php7.3-fpm -y

CMD ["php-fpm7.3", "-F"]