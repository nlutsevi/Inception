#https://techviewleo.com/how-to-install-mariadb-on-alpine-linux/
#https://wiki.alpinelinux.org/wiki/Mysql

FROM alpine:3.14

# Define environment vars
ARG	MYSQL_DB_USER
ARG	MYSQL_DB_DATABASE
ARG	MYSQL_DB_PASSWORD
ARG	MYSQL_DB_ROOT_PASSWORD

# Install maridb dependencies
RUN 	apk update && apk --no-cache upgrade && \
	#apk add mariadb
	#mariadb-client
	apk add mysql --no-cache \
	mysql-client --no-cache	
RUN	apk add openrc --no-cache

COPY	tools/ /tools/
RUN	chmod +x /tools/mariadb-init.sh
RUN	sh /tools/mariadb-init.sh

#EXPOSE	3306

#cmd 	["./tools/run_mariadb.sh"]
