#!/bin/sh

# Start mariadb
openrc
touch /run/openrc/softlevel
# Initialize mariadb database
/etc/init.d/mariadb setup
rc-service mariadb start

# Create root and normal user for our database
sed -i "s/bbdd/$MYSQL_DATABASE/" tools/init.sql
sed -i "s/user/$MYSQL_USER/" tools/init.sql
sed -i "s/pass/$MYSQL_PASSWORD/" tools/init.sql
sed -i "s/root_pass/$MYSQL_ROOT_PASSWORD/" tools/init.sql


mysql < tools/init.sql

# Add worldpressdb.sql to our database
#mysql -u root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < tools/wordpressdb.sql


#Secure mariadb database server
# mysql_secure_installation <<EOF
# root_pass
# N
# Y
# root_pass
# root_pass
# Y
# Y
# Y
# Y
# EOF
