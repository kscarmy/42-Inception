#!/bin/sh

CHECK_FILE="/etc/mysql/.flag"
if [ ! -f "$CHECK_FILE" ];then
    echo "mysql initialization..."
    service mysql start;
    mysql -h localhost -u root -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
    mysql -h localhost -u root -p${SQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
	echo "mysql initialization...2"
    mysql -h localhost -u root -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	echo "mysql initialization...3"
	mysql -h localhost -u root -p${SQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
	echo "mysql initialization...4"
    mysqladmin -h localhost -u root -p${SQL_ROOT_PASSWORD} -u root -p${SQL_ROOT_PASSWORD} shutdown
    echo "mysql initialization complete"
    touch "$CHECK_FILE"
fi

exec mysqld_safe