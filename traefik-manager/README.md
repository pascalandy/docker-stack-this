## What is this?
[Traefik](https://docs.traefik.io/configuration/backends/docker/) is a powerful layer 7 reverse-proxy. Once running, the proxy will give you access to 8 different webapps. I think this is a solid use-case to understand how to run this reverse-proxy.

## General consideration
One of my goal here is to create the quickest demo available around the Docker ecosystem.

To accomplish this, we put together the power of:

- **play-with-docker** (#pwg)
- **docker stacks**
- **docker Swarm mode**

I hope the community will use this repo as a base project to demo other stuff like CMS, Log, Monitoring, storage, benchmark and other cool applications we love to use in Docker. At the very moment, I’m trying to see if the [tink stack](https://github.com/influxdata/TICK-docker/issues/20) can work for my needs.

## See the demo

https://youtu.be/w3KM8yiC4d8 (90 seconds really!)

[![screen shot 2017-09-03 at 5 29 09 pm](https://user-images.githubusercontent.com/6694151/30006739-a068532a-90cd-11e7-98b8-444bc9a5d8d7.jpg)](https://youtu.be/w3KM8yiC4d8)

## Project source

Original post on my blog > http://pascalandy.com/blog/traefik-demo-docker-stack-and-play-with-docker/ and the [Github repo](https://github.com/pascalandy/docker-stack-this).

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

# Master should be stable
# but if working in a branch...
git checkout 1.03; sleep 1;

# Needed to mount the volume
mkdir -p /mnt/DeployGRP/tooldata/traefik/
touch /mnt/DeployGRP/tooldata/traefik/acme.json
chmod 600 /mnt/DeployGRP/tooldata/traefik/acme.json

# Launch all services
./_up
```

## Confirm Traefik is working
1. `docker service ls` is refreshing automatically for about 12 sec.

2. After a while (about 20 sec) we see the logs from Traefik. Do `CTRL-C` and return to terminal’s prompt.

3. Click on `80`. You see:

![home2](https://user-images.githubusercontent.com/6694151/30007620-10aedee8-90e1-11e7-8d9f-69310e289bf0.png)

4. Click on `8080` to see **Traefik dashboard**. We see all the services that run behind traefik. Great

```
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/
```

## Access all webapps
Overall there is 9 webapps running in this docker stack. 

To see a service just add the service name at the end of the address (ie `/a-cad`). See the section `Available services`.

**WARNING** - During your own play-with-ghost session, you will have another ip address than this one `10-0-7-3`

Per example: point to one of your 8 containers:

```

# home, the IP is probably different in you #pwg session
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/

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

- `./_up`
- `./_down`
- `./_restart` (typical flow when I debug)

This is all I got! Hope you enjoyed this!

## DEV vs PROD
This is **NOT prod ready**

What is do is that is use `traefik-private.toml` (which is outside of this repo) with prod data and overide `traefik.toml` file just after I cloned the repo. 

To the best of my knowledge, over `/docker-stack-this/traefik-manager/traefik-config/traefik.toml` update these values:

- traefik_basic_auth_user + password
- /etc/traefik/demoselfsign.crt
- /etc/traefik/demoselfsign.key
- lavida@gmail.com
- caServer

## Final word
Looking to **kickstart you website** (static page page + a CMS) ? Take a look at [play-with-ghost](http://play-with-ghost.com/) (another project I shared). It allows you to see and edit websites made with Ghost. In short, you can try Ghost on the spot without having to sign-up!

#### P.S.
If you have solid skills 🤓 with Docker Swarm, Linux bash and the gang and yo’re looking to help a startup to launch a solid project, I would love to get to know you. Buzz me 👋 on Twitter [@askpascalandy](https://twitter.com/askpascalandy). You can see the things that are done and the things we have to do [here](http://firepress.org/blog/technical-challenges-we-are-facing-now/).

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