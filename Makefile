.PHONY: all build up down clean fclean re

all: build

build:
	docker-compose -f srcs/docker-compose.yml up --build -d

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

clean:
	docker-compose -f srcs/docker-compose.yml down --remove-orphans

fclean: clean
	docker-compose -f srcs/docker-compose.yml rm -f
	docker rmi $$(docker images -q)

re: fclean all
