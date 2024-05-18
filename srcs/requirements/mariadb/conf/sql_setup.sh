#!/bin/sh

CHECK_FILE="/etc/mysql/.flag"
if [ ! -f "$CHECK_FILE" ];then

    service mysql start;
	# service mariadb start
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
    #mysql -e "SHOW DATABASES;"
    #mysql -e "USE inception"
    #mysql -e "SHOW TABLES"
    #mysql -e "DESCRIBE wp_users"
    #mysql -e "SELECT * FROM wp_users"
    mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
    #mysql -e "SELECT host, user, password FROM mysql.user;" 
    mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
    
	#mysql -uroot -p$SQL_ROOT_PQSSWORD -e "FLUSH PRIVILEGES;"
    mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown
    #mysql -e "SELECT * FROM inception.wp_users;" -uroot -prootpass
    echo "mysql initialization complete"

    touch "$CHECK_FILE"
fi

exec mysqld_safe