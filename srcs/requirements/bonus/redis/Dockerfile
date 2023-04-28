FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
    apt-get install redis-server -y && \
    echo "\nbind 0.0.0.0\nport 6379\n" > /etc/redis/redis.conf && \
    echo "protected-mode no\n" >> /etc/redis/redis.conf

EXPOSE 6379

ENTRYPOINT ["redis-server", "/etc/redis/redis.conf"]