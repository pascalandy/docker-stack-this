# Quick trial of this Docker Stack

*** WIP *** WIP *** WIP *** WIP *** WIP *** WIP 

I consider this README crystal clear. If there is anything that I could improve, please let me know :)

Project source: https://github.com/pascalandy/docker-stack-this

Why using a traefik and socketproxy together? **Listen** to this: https://cl.ly/1z0Q3a0K1M15

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
cd docker-stack-this/PXC-Cluster
echo && echo & sleep 1
\
# List nodes
docker node ls
echo && echo
\
# Deploy Stack
docker stack deploy -c docker-compose.yml galera
echo && echo
\
docker ps
echo && echo
\
# Find the ID for galera_proxy
ctn_NAME=galera_proxy && \
ctnID=$(docker ps -q --filter label=com.docker.swarm.service.name=$ctn_NAME)
echo "$ctnID"
echo && echo "galera_proxy ID is: $ctnID"
echo && echo
\
# Add nodes to our galera cluster
docker exec -i $ctnID add_cluster_nodes.sh
echo && echo
\
echo "Next define mysql password…"
echo && echo
```

## WIP

```
docker exec -it $ctnID mysql -uproxyuser -p
(I’ll define password as 123mysql123)

docker exec -it $ctnID mysql -uproxyuser -p123123123 \
-e "SHOW DATABASES;"
```

# — — — # — — — # — — — #

## Commands to debbug stuff

ctn_NAME=galera_proxy && \
ctnID=$(docker ps -q --filter label=com.docker.swarm.service.name=$ctn_NAME)
echo "$ctnID"

docker exec -i galera_proxy.1.mgr9h5f5c7hp6gu9lpvk6g89u add_cluster_nodes.sh

docker exec -it galera_proxy.1.mgr9h5f5c7hp6gu9lpvk6g89u mysql -uproxyuser -p

docker exec -it galera_proxy.1.mgr9h5f5c7hp6gu9lpvk6g89u mysql -uproxyuser -pMM98j290HU2vCD4f8723fZZ \
-e "SHOW DATABASES;"

docker exec -it $ctnID mysql --user=root --password=$ENV_PASS \

docker exec -it galera_proxy mysql -uproxyuser -pMM98j290HU2vCD4f8723fZZ \
-e "SHOW DATABASES;"

galera_proxy

# — — — # — — — # — — — #

## A last word

**P.S.** If you have solid skills 🤓 with Docker Swarm, Bash (and the gang)… plus you would love 💚 to help a startup to launch 🔥 a solid project, I would love to get to know you 🍻. Buzz me 👋 on Twitter [@askpascalandy](https://twitter.com/askpascalandy). I’m looking for bright and caring people to join in this journey 🌇.

Here, I [shared the details](http://firepress.org/blog/technical-challenges-we-are-facing-now/) of the challenges I’m facing at the moment.

Cheers!

```
 ____                     _      _              _
|  _ \ __ _ ___  ___ __ _| |    / \   _ __   __| |_   _
| |_) / _` / __|/ __/ _` | |   / _ \ | '_ \ / _` | | | |
|  __/ (_| \__ \ (_| (_| | |  / ___ \| | | | (_| | |_| |
|_|   \__,_|___/\___\__,_|_| /_/   \_\_| |_|\__,_|\__, |
                                                  |___/
```

