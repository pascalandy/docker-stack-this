# Quickly try this stack

I consider this README crystal clear. It should be quick for you to try the elements of this repo. If there is anything that I could improve, please let me know. **Source**: https://github.com/pascalandy/docker-stack-this

**Why using a traefik + socketproxy**?
Listen to this: https://cl.ly/1z0Q3a0K1M15

## Setup

1. On http://labs.play-with-docker.com/ create five instances.
2. Wait about 30sec after node5 is deployed to ensure the machines have a network.

3. On **node1**, copy-paste:

```
# Create Swarm
docker swarm init --advertise-addr eth0
TOKEN_LEAD=$(docker swarm join-token -q manager)
TOKEN_WORK=$(docker swarm join-token -q worker)
for N in $(seq 2 3); do
  DOCKER_HOST=tcp://node$N:2375 docker swarm join --token $TOKEN_LEAD node1:2377
done
for N in $(seq 4 5); do
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
cd docker-stack-this/traefik-haproxy
\
# Launch all services
./start
```

## Start and stop

Execute: `./start` and `./stop`

To see screen shots and each commands one by one, see [single_commands.md](https://github.com/pascalandy/docker-stack-this/blob/master/traefik-haproxy/single_commands.md)

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

