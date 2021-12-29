FROM alphine:3.15

#install nginx and openssl
RUN apt update && apt upgrade -y && apt install -y nginx \
													openssl
#define work directory for nginx
RUN mkdir -p /run/nginx && \
	chmod -R 755 /run/nginx

#define HTML path
COPY /requirements/nginx/tools/index.html /etc/nginx/html

#Configure SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout /etc/nginx/ssl/localhost_key.pem -out /etc/nginx/ssl/localhost.pem -days 3650 -subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=lm-h/CN=localhost"

#use your nginx.conf
COPY /requirements/nginx/tools/nginx.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/config_nginx /etc/nginx/sites-enabled/

#Ports
EXPOSE 443

#Start nginx. daemon off to make sure the container doesn't exit right after nginx starts
CMD ["nginx", "daemon off"]


#https://hub.docker.com/r/yobasystems/alpine-nginx/
