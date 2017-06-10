# Quick trial of this Docker Stack

https://github.com/pascalandy/docker-stack-this

I consider this README crystal clear. If there is anything that I could improve, please let me know :)

Traefik version is defined [here](https://github.com/pascalandy/docker-stack-this/blob/master/traefik-manager/proxy.yml#L6)

## Setup

1. Go to http://labs.play-with-docker.com/ and create **one** instance.
2. Wait about 30 sec after node5 is deployed to ensure the machines have a network.

3. On **node1**, copy-paste:

```
# Create Swarm
docker swarm init --advertise-addr eth0
\
# List nodes
docker node ls
\
# Clone repo
apk update && apk upgrade && apk add nano curl bash git
cd /root
git clone https://github.com/pascalandy/docker-stack-this.git
cd docker-stack-this/traefik-manager
\
# Launch all services
./_up
```

`docker service ls` is refreshing automatically
`CTRL-C` to move on
 
You’re up-and-running baby.
- Click on 80
- 

## up, down, restart

Execute:
- `./_run`
- `./_stop`
`./_restart` (typical flow when I debbug)

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

