FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install nginx -y

RUN apt-get install openssl -y

COPY conf/nginx.conf /etc/nginx/conf.d/

RUN mkdir /var/www/wordpress

COPY index.php /var/www/wordpress/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=BR/ST=SP/L=São Paulo/O=42FR/OU=42SP/CN=rruiz-la.42.sp" -keyout /etc/ssl/rruiz-la.key -out /etc/ssl/rruiz-la.crt

CMD ["nginx", "-g", "daemon off;"]