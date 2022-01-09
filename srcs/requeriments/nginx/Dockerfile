FROM alpine:3.15

#install nginx and openssl
RUN apt update && apt upgrade -y && apt install -y nginx \
													openssl
#define work directory for nginx and give permissions
RUN mkdir -p /run/nginx && \
	chmod -R 755 /run/nginx

#define HTML path
COPY /requeriments/nginx/tools/index.html /var/www/html/

#Configure SSL certificate
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout /etc/nginx/ssl/localhost_key.pem -out /etc/nginx/ssl/localhost.pem -days 3650 -subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=lm-h/CN=localhost"

#upload new nginx.conf
COPY /requeriments/nginx/tools/nginx.conf /etc/nginx/
COPY /requeriments/nginx/tools/default.conf /etc/nginx/http.d/
#RUN ln -s /etc/nginx/sites-available/config_nginx /etc/nginx/sites-enabled/

#Ports
EXPOSE 443

#Start nginx. daemon off to make sure the container doesn't exit right after nginx starts
CMD ["nginx", "daemon off"]


#https://hub.docker.com/r/yobasystems/alpine-nginx/
