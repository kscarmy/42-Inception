#Image used from Dockerhub
FROM debian:bullseye

#Updating sources
RUN apt update -y && apt upgrade -y

#Dependencies
RUN apt-get install -y wget \
php7.3 \
php-fpm \
php-mysql \
mariadb-client

#Getting wordpress v6.0 & unzipping
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

#PHP config setup
COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN	chown -R root:root /var/www/wordpress

#Setting up WordPressCLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/wpCLI.sh /wpCLI.sh

ENTRYPOINT ["bash", "wpCLI.sh"]