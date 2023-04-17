DOCKER_COMPOSE	=	./srcs/docker-compose.yml

DATA_PATH		=	/home/rruiz-la

DB_VOLUME		=	$(DATA_PATH)/data/db/
WP_VOLUME		=	$(DATA_PATH)/data/wp/

all:
	@ sudo mkdir -p $(DB_VOLUME)
	@ sudo mkdir -p $(WP_VOLUME)
	@ sudo sed -i "s/127.0.0.1	localhost/127.0.0.1 rruiz-la.42.fr/" /etc/hosts
	@ docker-compose -f $(DOCKER_COMPOSE) up --build -d

clean:
	@ docker-compose down -- volumes

fclean: clean
	@ sudo rm -rf $(DATA_PATH)

re: fclean all

stop:
	@ docker stop nginx mariadb wordpress

clean_up:
	@ bash ./srcs/requirements/tools/clean.sh

