#!/bin/bash

# Start mariadb with openrc 
openrc
touch /run/openrc/sotflevel

# Initialize mariadb database
/etc/init.d/mariadb setup

rc-service mariadb start

# Silenciar openrc issues
#sed -i "s/group_add_service/#group_add_service/"

# Create configuration file

cat << EOF > /tools/init.sql
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '$MYSQL_DB_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $MYSQL_DB_DATABASE;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_DB_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_DB_USER'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_DB_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

# Create Wordpress database

mysql < tools/init.sql

mysql -u root --password=$MYSQL_DB_ROOT_PASSWORD $MYSQL_DB_DATABASE < tools/wordpressdb.sql


# Secure mariadb database server
mysql_secure_instalation <<EOF
$MYSQL_DB_ROOT_PASSWORD
N
Y
N
Y
Y
Y
Y
EOF

