FROM alpine:3.11

# Install nginx and openssl. APK with Alpine
RUN apk update && apk add nginx && apk add openssl
# Define work directory for nginx and give permissions
RUN mkdir -p /run/nginx && \
	chmod -R 755 /run/nginx

# Define HTML path
COPY /tools/index.html /var/www/html/
#Docker-compose
#COPY /requeriments/nginx/tools/index.html /var/www/html/

# Configure SSL certificate
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout /etc/nginx/ssl/localhost_key.pem -out /etc/nginx/ssl/localhost.pem -days 3650 -subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=lm-h/CN=localhost"

# Upload new nginx.conf
COPY /tools/nginx.conf /etc/nginx/
COPY /tools/default.conf /etc/nginx/conf.d/
#Docker-compose
#COPY /requeriments/nginx/tools/nginx.conf /etc/nginx/
#COPY /requeriments/nginx/tools/default.conf /etc/nginx/http.d/


# Ports
EXPOSE 443

# Start nginx. daemon off to make sure the container doesn't exit right after nginx starts
CMD nginx -g 'daemon off;'


#https://hub.docker.com/r/yobasystems/alpine-nginx/
