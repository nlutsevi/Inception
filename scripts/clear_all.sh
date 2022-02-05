#!bin/bash

docker stop $(docker ps -a -q) 2>/dev/null 
docker rm -vf $(docker ps -aq -f)
docker rmi -f $(docker images -aq)
docker system prune -fa 2>/dev/null