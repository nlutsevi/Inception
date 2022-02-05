#!/bin/sh
sed -i "s/bbdd/$MYSQL_DATABASE/" tools/init.sql
sed -i "s/user/$MYSQL_USER/" tools/init.sql
sed -i "s/pass/$MYSQL_PASSWORD/" tools/init.sql
sed -i "s/rootp/$MYSQL_ROOT_PASSWORD/" tools/init.sql
sed -i "s/rootpass/$MYSQL_ROOT_PASSWORD/" tools/mariadb-init.sh
sed -i "s/bbdd/$MYSQL_DATABASE/" tools/mariadb-init.sh