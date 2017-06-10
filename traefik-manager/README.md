# Quick trial of this Docker Stack

I consider this README crystal clear. If there is anything that I could improve, please let me know :)

Why using a traefik and socketproxy together? **Listen** to this: https://cl.ly/1z0Q3a0K1M15

REPO: https://github.com/pascalandy/docker-stack-this

Traefik version is defined [here](https://github.com/pascalandy/docker-stack-this/blob/master/traefik-haproxy/_run#L37)

## Setup

1. Go to http://labs.play-with-docker.com/ and create five instances.
2. Wait about 30 sec after node5 is deployed to ensure the machines have a network.

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
./_run
```

You’re up-and-running baby! [See your web apps](https://github.com/pascalandy/docker-stack-this/blob/master/traefik-haproxy/single_commands.md#see-these-web-apps-online) online.

## run and stop

Execute: `./_run` and `./_stop`

To see screen shots of this stack and see how to run each commands one by one, see [single_commands.md](https://github.com/pascalandy/docker-stack-this/blob/master/traefik-haproxy/single_commands.md)

## A last word

**P.S.** If you have solid skills 🤓 with Docker Swarm, Linux bash and the gang* and you would love to help a startup to launch 🔥 a solid project, I would love to get to know you 🍻. Buzz me 👋 on Twitter [@askpascalandy](https://twitter.com/askpascalandy). You can see the things that are done and the things we have to do [here](http://firepress.org/blog/technical-challenges-we-are-facing-now/).

I’m looking for bright and caring people to join this [journey](http://firepress.org/blog/tag/from-the-heart/) with me.

Thanks in advance!
Pascal

```
 ____                     _      _              _
|  _ \ __ _ ___  ___ __ _| |    / \   _ __   __| |_   _
| |_) / _` / __|/ __/ _` | |   / _ \ | '_ \ / _` | | | |
|  __/ (_| \__ \ (_| (_| | |  / ___ \| | | | (_| | |_| |
|_|   \__,_|___/\___\__,_|_| /_/   \_\_| |_|\__,_|\__, |
                                                  |___/
```

