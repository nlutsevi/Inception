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
		apk add mariadb \
		mariadb-client \
		openrc

COPY	tools/ /tools/
RUN		chmod +x /tools/mariadb-init.sh
RUN		sh /tools/mariadb-init.sh

EXPOSE	3306

RUN		chmod +x /tools/run_mariadb.sh

CMD 	["./tools/run_mariadb.sh"]
