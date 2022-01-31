#!/bin/sh

# Start mariadb
openrc
touch /run/openrc/softlevel
# Initialize mariadb database
/etc/init.d/mariadb setup
rc-service mariadb start

# Create root and normal user for our database
cat << EOF > /tools/init.sql
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '$MYSQL_DB_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $MYSQL_DB_DATABASE;
CREATE USER '$MYSQL_DB_USER'@'%' IDENTIFIED BY '$MYSQL_DB_PASSWORD';
GRANT ALL ON $MYSQL_DB_DATABASE.* TO '$MYSQL_DB_USER'@'%';
GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_DB_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

mysql < tools/init.sql

# Add worldpressdb.sql to our database
mysql -u root --password=$MYSQL_DB_ROOT_PASSWORD $MYSQL_DB_DATABASE < tools/wordpressdb.sql

# Secure mariadb database server
mysql_secure_installation <<EOF
$MYSQL_DB_ROOT_PASSWORD
N
Y
N
Y
Y
Y
Y
EOF