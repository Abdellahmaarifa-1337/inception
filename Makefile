all:
	cd srcs && docker compose  up  --build

stop:
	docker ps -aq | xargs docker stop 
clean:
	docker ps -aq | xargs docker rm 
	docker compose down --rmi all
	docker volume ls -q | xargs docker volume rm

fclean:
	docker system prune --volume

re: fclean all

.PHONY : all clean fclean re