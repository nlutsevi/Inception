#!bin/bash

cd ..

cd srcs/

docker-compose down

docker system prune

docker rm -vf $(docker ps -aq)

docker rmi -f $(docker images -aq)
