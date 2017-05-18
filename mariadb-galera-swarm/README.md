# Quick trial of this Docker Stack

*** WIP *** WIP *** WIP *** WIP *** WIP *** WIP 


## Based on
https://github.com/colinmollenhour/mariadb-galera-swarm

## Setup

Based on https://github.com/xinity/pxc_swarm

1. Go to http://labs.play-with-docker.com/ and create five instances.
2. Wait about 30 sec after node5 is deployed to ensure the machines have a network.

3. On **node1**, copy-paste:

```
# Create Swarm
docker swarm init --advertise-addr eth0
TOKEN_LEAD=$(docker swarm join-token -q manager)
TOKEN_WORK=$(docker swarm join-token -q worker)
DOCKER_HOST=tcp://node$N:2375 docker swarm join --token $TOKEN_LEAD node1:2377
\
for N in $(seq 2 4); do
  DOCKER_HOST=tcp://node$N:2375 docker swarm join --token $TOKEN_WORK node1:2377
done
echo && echo & sleep 1
\
# Clone repo
apk update && apk upgrade && apk add nano curl bash git
cd /root
git clone https://github.com/pascalandy/docker-stack-this.git
cd docker-stack-this/mariadb-galera-swarm
echo && echo & sleep 1
\
# List nodes
docker node ls
echo && echo
\
# Create secrets
openssl rand -base64 32 | docker secret create xtrabackup_password -; 
openssl rand -base64 32 | docker secret create mysql_password -;
openssl rand -base64 32 | docker secret create mysql_root_password -;
\
docker stack deploy -c docker-compose.yml galera
\
# wait for `galera_seed` to be healthy
while echo; do
docker service ls
sleep 1.5
done
```

When `galera_seed` is healthy:

```
docker service scale galera_node=2
\
# wait for both `galera_node` instances to be healthy
while echo; do
docker service ls
sleep 1.5
done
```

When `galera_node` is healthy:
```
docker service scale galera_seed=0
docker service scale galera_node=3
while echo; do
docker service ls
sleep 1.5
done
```

###


galera_node.3.rz1bx2ryy3zamxev38kuzpj9t





