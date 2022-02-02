#!/bin/sh

#mysqld --user=mysql --datadir=/var/lib/mysql --port=3306 --plugin-dir=/usr/lib/mariadb/plugin #--log-error=/var/log/mysqld.log

# mysqld --print-defaults

#chmod 755 /var/lib/mysql

mysqld --user=mysql --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --pid-file=/run/mysqld/mariadb.pid --port=3306 --log-error=/var/log/mysqld.log --log-warnings=4 --skip-networking=0

# mysql_install_db –-user=mysql --ldata=/var/lib/mysql

# mysql_install_db --defaults-file=~/.my.cnf
