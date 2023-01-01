all:
	cd srcs && docker compose  up  --build --force-recreate

stop:
	docker ps -aq | xargs docker stop 
clean:
	docker ps -aq | xargs docker rm 
	docker volume ls -q | xargs docker volume rm -f
fclean:
	docker system prune --volumes -fa

re: fclean all

.PHONY : all clean fclean re