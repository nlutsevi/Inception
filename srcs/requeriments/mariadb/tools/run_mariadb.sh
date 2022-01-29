#!/bin/bash

#mysqld --user=mysql --datadir=/var/lib/mysql --password=$MYSQL_DB_ROOT_PASSWORD $MYSQL_DB_NAME

/bin/usr/mysqld --user=mysql --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --pid-file=/run/mysqld/mariadb.pid --port=3306 --log-error=/var/log/mysqld.log --log-warnings=4 --skip-networking=0



