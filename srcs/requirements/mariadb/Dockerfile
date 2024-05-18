#Image used from Dockerhub
FROM debian:buster

#Updating sources
RUN apt update -y && apt upgrade -y

#Dependencies
RUN apt-get install -y mariadb-server 

#Mariadb setup
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/sql_setup.sh /sql_setup.sh
RUN chmod +x sql_setup.sh

EXPOSE 3306

ENTRYPOINT ["bash", "sql_setup.sh"]