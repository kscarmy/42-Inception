#!bin/sh
sleep 10;
# if [ ! -e /var/www/wordpress/wp-config.php ]; then
#     cd /var/www/wordpress
#     wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'

#     # sleep 5;
#     wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
#     wp user create      --allow-root --role=author $MYUSER $MYUSER_MAIL --user_pass=$MYUSER_PASS --path='/var/www/wordpress' >> /log.txt
#     #Allow users to upload images
#     chown -R www-data /var/www/wordpress/wp-content/uploads
# fi

if [ ! -e /var/www/wordpress/wp-config.php ]; then
    cd /var/www/wordpress
    
    # Créer le fichier de configuration wp-config.php
    wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'

    # Installer WordPress
    wp core install --url=$DOMAIN_NAME --title="$SITE_TITLE" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
    
    # Créer un utilisateur avec le rôle d'auteur
    wp user create --allow-root --role=author $MYUSER $MYUSER_MAIL --user_pass=$MYUSER_PASS --path='/var/www/wordpress' >> /log.txt
    
    # Permettre aux utilisateurs de télécharger des images
    chown -R www-data:www-data /var/www/wordpress/wp-content/uploads
fi

if [ -d /run/php ]; then
    # mkdir /run/php
	rm -r /run/php
fi

# service --status-all
# rm -r /run/php
# ls -la /run/php/

# /usr/sbin/php-fpm7.3 -F
# /usr/sbin/php7.4-fpm -F

# service php7.2-fpm restart
service php7.4-fpm start
# /etc/init.d/php7.4-fpm -F

# service --status-all

# /usr/sbin/apache2 -D FOREGROUND
