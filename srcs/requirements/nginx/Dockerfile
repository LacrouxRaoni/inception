FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nginx -y && \
    apt-get install openssl -y

COPY conf/rruiz-la.conf /etc/nginx/sites-available

RUN ln -s /etc/nginx/sites-available/rruiz-la.conf /etc/nginx/sites-enabled/rruiz-la.conf && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=BR/ST=SP/L=São Paulo/O=42FR/OU=42SP/CN=rruiz-la.42.sp" -keyout /etc/ssl/rruiz-la.key -out /etc/ssl/rruiz-la.crt

CMD ["nginx", "-g", "daemon off;"]