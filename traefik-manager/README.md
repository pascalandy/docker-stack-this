## What is this?
Traefik is a powerful layer 7 reverse-proxy. Once running, the proxy will give you access to 8 different webapps. I think this is a solid use-case to understand how to run this reverse-proxy.

## General consideration
One of my goal here is to create the quickest demo available around the Docker ecosystem. To do this we will use the power of **play-with-docker** and **Docker Stacks** on top of nd **Docker Swarm Mode**.

I hope the community will use this repo as a base project to demo other stuff like CMS, Log, Monitoring, storage, benchmark and other cool applications we love to use in Docker.

## See the demo

https://youtu.be/w3KM8yiC4d8 (90 seconds really!)

[![screen shot 2017-09-03 at 5 29 09 pm](https://user-images.githubusercontent.com/6694151/30006739-a068532a-90cd-11e7-98b8-444bc9a5d8d7.jpg)](https://youtu.be/w3KM8yiC4d8)

## Project source

https://github.com/pascalandy/docker-stack-this

## Something looks weird? Please let me know
I consider this README crystal clear. If there is anything that I could improve, please let me know via an issue.

## Traefik version 
Find it [here](https://github.com/pascalandy/docker-stack-this/blob/master/traefik-manager/toolproxy.yml#L9)

## Ready. Go!
1. Go to http://labs.play-with-docker.com/ 
2. Create **1 instance** and wait for for the node to provision
3. On **node1**, copy-paste:

```
# Create Swarm
docker swarm init --advertise-addr eth0

# List nodes
docker node ls

# Install common apps
apk update && apk upgrade && apk add nano curl bash git wget unzip ca-certificates

# Clone repo
cd /root
git clone https://github.com/pascalandy/docker-stack-this.git
cd docker-stack-this/traefik-manager

# Needed to mount the volume
mkdir -p /mnt/DeployGRP/tooldata/traefik/
touch /mnt/DeployGRP/tooldata/traefik/acme.json

# Launch all services
./_up
```

## Confirm Traefik is working
1. `docker service ls` is refreshing automatically. We see that services are getting provisioned every 3 seconds via Docker swarm.

2. After a while (about 20 seconds) we see the logs from Traefik. Do `CTRL-C` and return to terminal’s prompt.

3. Click on `8080` to see **Traefik dashboard**. We see all the services that run behind traefik. Great

4. Click on `80`. You see `404 page not found`. It’s ok! Here is the address I see during my PWD session:

```
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/
```

## Access the webapps
To see a service just add the service name at the end of the address (ie `/a-cad`). See the section `Available services`.

Here is how I define `a-cad` for the service caddy: https://github.com/pascalandy/docker-stack-this/blob/master/traefik-manager/toolweb.yml#L34

#### Available services
**WARNING** - During your own play-with-ghost session, you will have another ip address than this one `10-0-7-3`

Per example: point to one of your 8 containers:

```
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/a-who
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/a-cad
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/a-gix
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/a-der

http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/b-who
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/b-cad
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/b-gix
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/b-der
```

#### Web apps details:
- **cad** = [caddy](https://hub.docker.com/r/abiosoft/caddy/)
- **gix** = [nginx](https://hub.docker.com/_/nginx/)
- **who** = [whoami](https://hub.docker.com/r/emilevauge/whoami/) by Émile Vauge
- **der** = [whoami](https://hub.docker.com/r/jwilder/whoami/) by jwilder

Other things to know:

- `a` and `b` are two independant instances of the same app
- All 8 services have a `replica=2`

## Commands
Just execute:

- `./_run`
- `./_stop`
- `./_restart` (typical flow when I debbug)

This is all I got! Hope you enjoyed this!

## Final word
Looking to **kickstart you website** (static page page + a CMS) ? Take a look at [play-with-ghost](http://play-with-ghost.com/) (another project I shared). It allows you to see and edit websites made with Ghost. In short, you can try Ghost on the spot without having to sign-up!

#### P.S.
If you have solid skills 🤓 with Docker Swarm, Linux bash and the gang* and you would love to help a startup to launch 🔥 a solid project, I would love to get to know you 🍻. Buzz me 👋 on Twitter [@askpascalandy](https://twitter.com/askpascalandy). You can see the things that are done and the things we have to do [here](http://firepress.org/blog/technical-challenges-we-are-facing-now/).

I’m looking for bright and caring people to join this [journey](http://firepress.org/blog/tag/from-the-heart/) with me.

```
 ____                     _      _              _
|  _ \ __ _ ___  ___ __ _| |    / \   _ __   __| |_   _
| |_) / _` / __|/ __/ _` | |   / _ \ | '_ \ / _` | | | |
|  __/ (_| \__ \ (_| (_| | |  / ___ \| | | | (_| | |_| |
|_|   \__,_|___/\___\__,_|_| /_/   \_\_| |_|\__,_|\__, |
                                                  |___/
```

Cheers!
Pascal