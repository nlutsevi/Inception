#!/bin/sh

# Start mariadb
openrc
touch /run/openrc/softlevel
# Initialize mariadb database
/etc/init.d/mariadb setup
rc-service mariadb start

# Create root and normal user for our database
mysql < tools/init.sql

# Add worldpressdb.sql to our database
#mysql -u root --password='rootpass' 'bbdd' < tools/wpbbdd.sql
