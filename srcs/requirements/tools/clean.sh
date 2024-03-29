#!/bin/bash

# Stop all running containers
docker stop $(docker ps -qa)

# Remove all stopped containers
docker rm $(docker ps -qa)

# Remove all images
docker rmi -f $(docker images -qa)

# # Remove all volumes
docker volume rm $(docker volume ls -q)

# Remove all networks /
docker network rm $(docker network ls -q)2>/dev/null

# Remove volumes into host
sudo rm -rf /home/rruiz-la