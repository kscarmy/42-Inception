#!bin/sh
sleep 5;
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    cd /var/www/wordpress
    wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'

    # sleep 5;
    wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
    wp user create      --allow-root --role=author $MYUSER $MYUSER_MAIL --user_pass=$MYUSER_PASS --path='/var/www/wordpress' >> /log.txt
    #Allow users to upload images
    chown -R www-data /var/www/wordpress/wp-content/uploads
fi

if [ ! -d /run/php ]; then
    mkdir /run/php
fi

/usr/sbin/php-fpm7.3 -F

service php7.2-fpm restart