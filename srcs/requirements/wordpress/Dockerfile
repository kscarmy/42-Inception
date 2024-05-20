FROM debian:bullseye

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    curl \
    wget \
    unzip \
    less \
    mariadb-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Créer le répertoire pour le fichier PID de PHP-FPM et ajuster les permissions
RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php

# Télécharger et extraire WordPress
RUN wget https://wordpress.org/latest.tar.gz -P /var/www/
RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz
RUN chown -R www-data:www-data /var/www/wordpress

# RUN mkdir -p /var/run/php-fpm/

# Configurer PHP-FPM pour écouter sur le port 9000
RUN sed -i 's/listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

# Copier le fichier de configuration de PHP-FPM
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Exposer le port 9000 pour la communication avec Nginx
EXPOSE 9000

# Démarrer PHP-FPM en mode foreground
CMD ["php-fpm7.4", "--nodaemonize"]

# CMD ["service", "php-fpm7.4", "start"]
