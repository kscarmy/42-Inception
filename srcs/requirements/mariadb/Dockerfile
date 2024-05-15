# Jean michel olas 
FROM debian:11
RUN apt update

#	OPTIONS : VIM
# RUN apt install vim -y

#	MARIADB :
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh	/tmp/mdb_script.sh

RUN sh /tmp/mdb_script.sh

