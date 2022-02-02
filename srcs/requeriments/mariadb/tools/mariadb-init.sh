#!/bin/sh

# Start mariadb
openrc
touch /run/openrc/softlevel
# Initialize mariadb database
/etc/init.d/mariadb setup
rc-service mariadb start

# Create root and normal user for our database
# sed "s/bbdd/$MYSQL_DATABASE/" tools/init.sql
# sed "s/user/$MYSQL_USER/" tools/init.sql
# sed "s/pass/$MYSQL_PASSWORD/" tools/init.sql
# sed "s/root_pass/$MYSQL_ROOT_PASSWORD/" tools/init.sql

cat << EOF > /tools/init.sql
CREATE USER 'root'@'%' IDENTIFIED BY 'root_pass';
CREATE DATABASE mariadb;
CREATE USER 'nati@'%' IDENTIFIED BY 'pass';
GRANT ALL ON mariadb.* TO 'nati'@'%';
GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root_pass';
FLUSH PRIVILEGES;
EOF

# cat << EOF > /tools/init.sql
# CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
# CREATE DATABASE $MYSQL_DATABASE;
# CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
# GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
# GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
# FLUSH PRIVILEGES;
# EOF

mysql < tools/init.sql

# Add worldpressdb.sql to our database
# mysql -u root --password=$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < tools/wordpressdb.sql
mysql -u root --password='root_pass' 'mariadb' < tools/wordpressdb.sql


#Secure mariadb database server
mysql_secure_installation <<EOF
root_pass
N
Y
root_pass
root_pass
Y
Y
Y
Y
EOF
