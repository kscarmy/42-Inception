VOLUMES	=	/home/douglas/data

all:
	docker-compose -f srcs/docker-compose.yml up -d --build

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	docker-compose -f srcs/docker-compose.yml down -v
	docker rmi $$(docker images -q)

fclean: clean
	docker system prune -af

wipe: fclean
	sudo rm -rf $(VOLUMES)/wordpress
	sudo rm -rf $(VOLUMES)/mariadb
	mkdir $(VOLUMES)/wordpress
	chmod 777 $(VOLUMES)/wordpress
	mkdir $(VOLUMES)/mariadb
	chmod 777 $(VOLUMES)/mariadb

rere: fclean all

re: clean all