#!/bin/sh

# Add permission to make this file executable
# chmod +x start.sh

docker network create --driver overlay --subnet 10.11.10.0/24 --opt encrypted ntw_front
docker network create --driver overlay --subnet 10.12.10.0/24 --opt encrypted ntw_socketproxy
docker network ls | grep "ntw_"

docker service create \
--name socketproxy \
--network ntw_socketproxy \
--mode global \
--mount "type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock" \
--constraint 'node.role==manager' \
-e CONTAINERS=1 \
-e NETWORKS=1 \
-e SERVICES=1 \
-e SWARM=1 \
-e TASKS=1 \
tecnativa/docker-socket-proxy

echo; echo

docker service create \
--name traefik \
--network ntw_front \
--network ntw_socketproxy \
--mode global \
-p 80:80 \
-p 443:443 \
-p 8080:8080 \
--constraint 'node.role==worker' \
traefik \
--docker \
--docker.swarmmode \
--docker.endpoint=tcp://socketproxy:2375 \
--web

echo; echo

docker stack deploy who -c who.yml
docker stack deploy caddy -c caddy.yml
docker stack deploy nginx -c nginx.yml

echo; echo

docker service ls
