# Jean michel olas 
FROM debian:11
RUN apt update

#	OPTIONS : VIM
# RUN apt install vim -y

#	WordPress :
RUN apt-get install wget -y

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN		chown -R root:root /var/www/wordpress


# FROM debian:bullseye

# RUN apt-get update && apt-get install -y \
#     php7.4-fpm \
#     php7.4-mysql \
#     curl \
#     && curl -O https://wordpress.org/latest.tar.gz \
#     && tar -xzvf latest.tar.gz \
#     && rm latest.tar.gz \
#     && mv wordpress /var/www/html \
#     && chown -R www-data:www-data /var/www/html

# # COPY ./conf/php.ini /usr/local/etc/php/

# CMD ["php-fpm"]
