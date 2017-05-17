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
for N in $(seq 2 5); do
  DOCKER_HOST=tcp://node$N:2375 docker swarm join --token $TOKEN_WORK node1:2377
done
\
# List nodes
docker node ls
\
# Clone repo
apk update && apk upgrade && apk add nano curl bash git
cd /root
git clone https://github.com/pascalandy/docker-stack-this.git
cd docker-stack-this/PXC-Cluster
```

You’re up-and-running baby! [See your web apps](https://github.com/pascalandy/docker-stack-this/blob/master/traefik-haproxy/single_commands.md#see-these-web-apps-online) online.

## WIP

docker exec -i galera_proxy.1.mgr9h5f5c7hp6gu9lpvk6g89u add_cluster_nodes.sh

docker exec -it galera_proxy.1.mgr9h5f5c7hp6gu9lpvk6g89u mysql -uproxyuser -p

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

