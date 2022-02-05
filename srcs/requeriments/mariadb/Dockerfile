FROM alpine:3.14

# Define environment vars
ARG		MYSQL_USER
ARG		MYSQL_DATABASE
ARG		MYSQL_PASSWORD
ARG		MYSQL_ROOT_PASSWORD

# Install maridb dependencies
RUN 	apk update && apk --no-cache upgrade && \
		apk add mariadb \
		mariadb-client \
		openrc

# Mariadb instllation and setup files
COPY	tools/ /tools/
RUN		chmod +x /tools/mariadb-init.sh
RUN		chmod +x /tools/env_vars.sh
RUN 	sh /tools/env_vars.sh
RUN		sh /tools/mariadb-init.sh

EXPOSE	3306

RUN		chmod +x /tools/run_mariadb.sh

CMD 	["./tools/run_mariadb.sh"]
