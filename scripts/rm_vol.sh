#!bin/bash

docker volume rm srcs_wp_vol
docker volume rm srcs_db_vol
docker volume prune
docker system prune
