#!/bin/bash

docker ps -aq | xargs docker rm
docker volume ls -q | xargs docker volume rm
docker compose down --rmi all
docker compose up --build