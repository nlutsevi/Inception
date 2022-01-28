#!/bin/bash

mysqld --user=mysql --datadir=/var/lib/mysql --password=$MYSQL_DB_ROOT_PASSWORD $MYSQL_DB_NAME


