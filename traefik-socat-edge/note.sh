
docker network create --driver overlay --subnet 10.11.10.0/24 --opt encrypted ntw_front
docker network create --driver overlay --subnet 10.10.10.0/24 --opt encrypted traefik_ntw_front

docker network create --driver overlay --subnet 10.12.10.0/24 --opt encrypted ntw_socket

docker network create --driver overlay --subnet 10.13.10.0/24 --opt encrypted ntw_back
docker network ls

docker stack deploy dockersocket -c dockersocket.yaml
docker stack deploy traefik -c traefik.yaml

docker stack deploy who1 -c who1.yml
docker stack deploy who2 -c who2.yml
docker stack deploy caddy1 -c caddy1.yml
docker stack deploy nginx1 -c nginx1.yml


# — — — # — — — # — — — #
docker stack rm traefik
docker stack rm dockersocket

docker stack rm who1
docker stack rm who2
docker stack rm caddy1
docker stack rm nginx1

docker network rm ntw_front
docker network rm ntw_socket
docker network rm ntw_back