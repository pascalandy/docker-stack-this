
docker network create --driver overlay --subnet 10.11.10.0/24 --opt encrypted ntw_front
docker network create --driver overlay --subnet 10.10.10.0/24 --opt encrypted traefik_ntw_front

docker network create --driver overlay --subnet 10.12.10.0/24 --opt encrypted ntw_socket

docker network create --driver overlay --subnet 10.13.10.0/24 --opt encrypted ntw_back
docker network ls

docker stack deploy dockersocket -c dockersocket.yml
docker stack deploy traefik -c traefik.yml



docker network rm ntw_front
docker network rm ntw_socket
docker network rm ntw_back