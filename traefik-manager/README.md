

## General consideration

One of my goal here is to create the quickest demo available on the Internet. I consider this README crystal clear. If there is anything that I could improve, please let me know via an issue.

Traefik version is defined [here](https://github.com/pascalandy/docker-stack-this/blob/master/traefik-manager/proxy.yml#L6)

## Project source
https://github.com/pascalandy/docker-stack-this

## ACME

ACME, is supported within this configuration and I [working on it](https://github.com/pascalandy/docker-stack-this/issues/5)!

## Ready Go!

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

1) `docker service ls` is refreshing automatically. We see that services are getting provisioned every 3 seconds via Docker swarm.

2) After a while (about 20 seconds) we see the logs from Traefik. Do `CTRL-C` and return to terminal’s prompt.

3) Click on `8080` to see **Traefik dashboard**. We see all the services that run behind traefik. Great

4) Click on `80`. You see `404 page not found`. It’s ok! Here is the address I see during my PWD session:

```
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/
```

## How to see our services

To see a service just add the service name at the end of the address (ie `/a-cad`). See the section `Available services`.

Here is how I define `a-cad` for the service caddy: https://github.com/pascalandy/docker-stack-this/blob/master/traefik-manager/toolweb.yml#L34

#### Nomenclature: 

- **a** is for instance b
- **b** is for instance b
- **cad** = caddy (webserver made in go)

Each instances have `replicas=2`.

**WARNING** - Of course during your own play-with-ghost session, you will have another ip address than `10-0-7-3`

## Available services
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

I think this is a solid case to understand an valide how to run this reverse-proxy.

## up, down, restart

Execute:
- `./_run`
- `./_stop`
- `./_restart` (typical flow when I debbug)

This is all I got! You are welcome :)

## Screenshots

wip

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

