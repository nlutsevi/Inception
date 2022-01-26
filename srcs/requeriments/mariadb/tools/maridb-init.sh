#!/bin/bash

# Initialize mariadb
sudo /etc/ini.d/mariadb setup

# Start mariadb database on Alpine
sudo rc-service mariadb start

# Set the service to be started at system boot
sudo rc-update add mariadb default




# Secure mariadb database server
sudo mysql_secure_instalation <<EOF
$MYSQL_DB_ROOT_PASSWORD
N
Y
N
Y
Y
Y
Y
EOF

