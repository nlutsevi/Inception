#!/bin/bash

# Initialize mariadb
#/etc/ini.d/mariadb setup

# Start mariadb with openrc 
openrc
touch /run/openrc/sotflevel
#rc-service mariadb start

# Set the service to be started at system boot
rc-update add mariadb default

# Initialize mariadb database
/etc/ini.d/mariadb setup

rc-service mariadb start




# Secure mariadb database server
#mysql_secure_instalation <<EOF
#$MYSQL_DB_ROOT_PASSWORD
#N
#Y
#N
#Y
#Y
#Y
#Y
#EOF

