#https://techviewleo.com/how-to-install-mariadb-on-alpine-linux/

FROM alpine:3.14

# Define environment vars
ARG	MYSQL_DB_USER
ARG	MYSQL_DB_DATABASE
ARG	MYSQL_DB_PASSWORD
ARG	MYSQL_DB_ROOT_PASSWORD

# Install maridb dependencies
RUN 	apk update && apk upgrade && \
	apk add mariadb \
	mariadb-client \
	openrc

COPY	tools/ /tools/
RUN	sh /tools/mariadb-init.sh

EXPOSE	3306

cmd 	["./tools/run_mariadb.sh"]
