#!/bin/bash

# Stop all running containers
if docker ps | grep "nginx"; then
    docker stop nginx
fi
if docker ps | grep "mariadb"; then
    docker stop mariadb
fi
if docker ps | grep "wordpress"; then
    docker stop wordpress
fi

# Remove all stopped containers
if docker ps -a | grep "nginx"; then
    docker rm -f nginx
fi
if docker ps -a | grep "mariadb"; then
    docker rm -f mariadb
fi
if docker ps -a | grep "wordpress"; then
    docker rm -f wordpress
fi

# Remove all images
if docker images | grep "nginx"; then
    docker rmi -f nginx
fi
if docker images | grep "mariadb"; then
    docker rmi -f mariadb
fi
if docker images | grep "wordpress"; then
    docker rmi -f wordpress
fi

# # Remove all volumes
if docker volume ls | grep "srcs_mariadb-volume"; then
    docker volume rm srcs_mariadb-volume
fi
if docker volume ls | grep "srcs_wordpress-volume"; then
    docker volume rm srcs_wordpress-volume
fi

# Remove all networks /
if docker volume ls | grep "inception"; then
    docker network rm inception
fi
# Remove volumes into host
sudo rm -rf /home/fagiusep