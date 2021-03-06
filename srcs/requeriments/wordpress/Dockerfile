FROM alpine:3.14

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD

# Define work directory
RUN mkdir /var/www && \
	mkdir /var/www/html && \
	chmod 755 var && \
	chmod 755 /var/www && \
	chmod 755 /var/www/html

# FTP config
COPY tools/wp-config.php /var/www/html/wordpress/
COPY tools/start-wp.sh /var/www/html/wordpress/

# Init .env vars
RUN chmod 777 /var/www/html/wordpress/start-wp.sh
RUN ./var/www/html/wordpress/start-wp.sh

# Install dependencies
RUN apk update && \
	apk add php php-fpm php-opcache php-mysqli php php-phar php-curl php-dom php-exif php-fileinfo php-json php-mbstring php-sodium php-openssl php-xml php-zip && \
	apk add wget && \
	apk add vim && \
	apk add --no-cache tar && \
	apk add openrc

# Install wordpress
RUN  wget https://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	mv wordpress/* /var/www/html/wordpress && \
	rm -rf wordpress

# Remove wordpress package
RUN rm -rf latest.tar.gz

# Listening
EXPOSE 9000

RUN echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf

# PHP-fpm service start
CMD ["php-fpm7", "--nodaemonize"] 
