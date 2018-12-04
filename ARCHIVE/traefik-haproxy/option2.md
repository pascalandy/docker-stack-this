
##### Option #2 (plan B) | socketproxy

```
docker service rm socketproxy && \
\
docker service create \
--name socketproxy \
--network ntw_socketproxy \
--mode global \
--mount "type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock" \
--constraint 'node.role==manager' \
rancher/socat-docker
```