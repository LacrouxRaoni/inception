FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install redis-server -y

RUN sed -i "s/supervised no/supervised systemd/g" /etc/redis/redis.conf

#Set max memory redis can use
RUN sed -i "s/# maxmemory <bytes>/maxmerory 1M/g" /etc/redis/redis.conf

#What to remove when max memory is reached (lfu - Least Frequently Used)
RUN sed -i "s/# maxmemory-policy noeviction/maxmerory-policy allkeys-lfu/g" /etc/redis/redis.conf

#Listen to all interfaces on port(.0.0.0.0 means that any IP can connect to port 6379)
RUN sed -i "s/bind 127.0.0.1 ::1/bind 0.0.0.0/g" /etc/redis/redis.conf

#Enable clients from anothers hosts to connect to Redis
RUN sed -i "s/protected-mode yes/protected-mode no/g" /etc/redis/redis.conf

# RUN mkdir /data && chown redis:redis /data

EXPOSE 6379

CMD ["redis-server"]