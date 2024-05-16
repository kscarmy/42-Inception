# # Jean michel olas 
# FROM debian:11
# RUN apt update

# #	OPTIONS : VIM
# # RUN apt install vim -y

# #	NGINX :
# RUN apt install -y nginx
# RUN mkdir -p /var/run/nginx

# COPY conf/nginx.conf /etc/nginx/nginx.conf

# #	SSL :
# RUN mkdir -p /etc/nginx/ssl
# RUN apt install openssl -y
# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=guderram.42.fr/UID=guderram"

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html


# EXPOSE 443

# CMD [ "nginx", "-g", "daemon off;" ]

FROM debian:bullseye

RUN apt-get update
RUN apt install nginx -y
RUN apt install openssl -y
RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=guderram.42.fr/UID=guderram"

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html




# COPY ./conf/nginx.conf /etc/nginx/nginx.conf


CMD ["nginx", "-g", "daemon off;"]
