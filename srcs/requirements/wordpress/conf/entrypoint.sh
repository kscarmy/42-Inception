#!/bin/bash
sleep 7;
set -e

# Afficher les variables pour debug
echo "WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST}"
echo "WORDPRESS_DB_USER=${WORDPRESS_DB_USER}"
echo "WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}"
echo "WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}"

# Vérifier si wp-config.php existe déjà
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	cd /var/www/wordpress

	# Télécharger WP-CLI
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	# Générer le fichier wp-config.php
	wp config create --dbname="${WORDPRESS_DB_NAME}" --dbuser="${WORDPRESS_DB_USER}" --dbpass="${WORDPRESS_DB_PASSWORD}" --dbhost="${WORDPRESS_DB_HOST}" --path="/var/www/wordpress" --allow-root

	# Installer WordPress
	wp core install --url="https://guderram.42.fr" --title="didier" --admin_user="${ADMIN_USER}" --admin_password="${ADMIN_PASSWORD}" --admin_email="didier@example.com" --skip-email --path="/var/www/wordpress" --allow-root

	chown -R www-data:www-data /var/www/wordpress
fi

exec "$@"
