#!bin/bash

docker volume rm srcs_wp_vol
docker volume rm srcs_db_vol
docker volume prune 2>/dev/null
docker system prune 2>/dev/null