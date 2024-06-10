# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: achansar <achansar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/10 16:26:09 by achansar          #+#    #+#              #
#    Updated: 2024/06/10 16:26:12 by achansar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@mkdir -p /home/achansar/data/mysql;
	@mkdir -p /home/achansar/data/html;
	docker compose -f ./srcs/docker-compose.yml up -d --build

up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f  ./srcs/docker-compose.yml down

clean: down
	docker compose -f ./srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@sudo rm -rf /home/achansar/data/mysql;
	@sudo rm -rf /home/achansar/data/html;

re: fclean all

.PHONY: all up down clean fclean re
