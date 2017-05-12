
docker service create
--name socketproxy \
--network ntw_back \
--mount "type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock" \
--constraint 'node.role==manager' \
rancher/socat-docker


docker service create
--name traefik \
-p 80:80 \
-p 8080:8080 \
--network ntw_front \
--network ntw_back \
--constraint 'node.role==worker' \
traefik \
--docker \
--docker.swarmmode \
--docker.endpoint=tcp://docker-proxy:2375 \
--web