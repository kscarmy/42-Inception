# Jean michel olas 
FROM debian:11
RUN apt update

#	OPTIONS : VIM
# RUN apt install vim -y

#	MARIADB :
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# # COPY tools/script.sh	/tmp/mdb_script.sh

# # RUN sh /tmp/mdb_script.sh




# FROM debian:bullseye

# RUN apt-get update
# RUN apt-get install mariadb-server -y

# # COPY ./conf/my.cnf /etc/mysql/my.cnf
# COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf


# CMD ["mysqld"]






# FROM debian:11

# # Mettre à jour les sources et installer les dépendances nécessaires
# # RUN apt-get update -y
# # RUN apt install gnupg -y
# # RUN apt-get install lsb-release -y


# # Ajouter le dépôt officiel MariaDB
# # RUN apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc' && \
# #     echo "deb http://ftp.ubuntu-tw.org/mirror/mariadb/repo/10.5/debian $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/mariadb.list

# # Mettre à jour les sources et installer MariaDB
# # RUN apt-get update -y
# RUN apt-get install mariadb-server -y

# # Copier le fichier de configuration
# # COPY ./conf/my.cnf /etc/mysql/my.cnf
# COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf


# # Commande pour démarrer MariaDB
# CMD ["mysqld"]
