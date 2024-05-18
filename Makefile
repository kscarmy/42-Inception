USER_HOME = /home/guderram

all:
	sudo mkdir -p $(USER_HOME)/data/mariadb
	sudo mkdir -p $(USER_HOME)/data/wordpress
	chmod 777 $(USER_HOME)/data/wordpress
	chmod 777 $(USER_HOME)/data/mariadb
	docker-compose -f srcs/docker-compose.yml up -d --build

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	docker-compose -f srcs/docker-compose.yml down -v
	docker rmi $$(docker images -q)
	rm -rf $(USER_HOME)/data

fclean: clean
	docker system prune -af

rere: fclean all

re: clean all