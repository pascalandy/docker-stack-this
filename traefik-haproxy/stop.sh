#!/bin/sh

docker service rm socketproxy
docker service rm traefik

docker stack rm who
docker stack rm caddy
docker stack rm nginx

docker network rm ntw_front
docker network rm ntw_socketproxy

docker system prune -f