#https://techviewleo.com/how-to-install-mariadb-on-alpine-linux/

# Define environment vars
ARG	MYSQL_DB_USER
ARG	MYSQL_DB_DATABASE
ARG	MYSQL_DB_PASSWORD
ARG	MYSQL_DB_ROOT_PASSWORD

# Install maridb dependencies
RUN 	apk update && apk upgrade && \
	apk add mariadb \
	mariadb-common \
	mariadb-client \
	openrc

EXPOSE	3306

COPY	tools/ /tools/
RUN	bash /tools/mariadb-init.sh

RUN 	[""]
