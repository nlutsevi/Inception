#!bin/bash

cd ..

cd srcs/

docker-compose down

docker rm -vf $(docker ps -aq -f)

docker rmi -f $(docker images -aq)

docker system prune -fa 2>/dev/null