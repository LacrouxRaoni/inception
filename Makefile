DOCKER_COMPOSE	=	./srcs/docker-compose.yml

DATA_PATH		=	/home/rruiz-la/data

DB_VOLUME		=	$(DATA_PATH)/db/
WP_VOLUME		=	$(DATA_PATH)/wp/

all:
	@ sudo mkdir -p $(DB_VOLUME)
	@ sudo mkdir -p $(WP_VOLUME)
	@ sudo sed -i "s/127.0.0.1	localhost/127.0.0.1 rruiz-la.42.fr/" /etc/hosts
	@ docker-compose -f $(DOCKER_COMPOSE) up --build -d

clean: stop
	@ docker system prune -a --force

fclean: clean
	@ sudo rm -rf /home/rruiz-la

re: fclean all

stop:
	@ docker-compose -f $(DOCKER_COMPOSE) down
