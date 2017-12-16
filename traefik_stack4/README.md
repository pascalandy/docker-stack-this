

WIP 2017-12-16_14h30

## Introduction
This project will run those services (Traefik, Portainer, Nginx, Caddy, Whoami) in one simple copy-paste command. Please also refer the the [README](https://github.com/pascalandy/docker-stack-this/blob/master/README.md) at the root of this repo.

**based on**:
- https://jmaitrehenry.ca/2017/12/15/using-traefik-with-docker-swarm-and-consul-as-your-load-balancer/
- 
#### Anything special about this mono repo?
- This stack does not use ACME (https://). ACME is a pain while developping … reaching limits, etc.
- I still have issues in the project `traefik-manager` which use ACME.
- If you don’t want to use socat, see `traefik-manager-noacme`

## Launching the Docker stack
1. Go to http://labs.play-with-docker.com/ 
2. Create **a cluster** (3 managers + 2 workers). Wait for he nodes to provision
3. On **manage 1**, copy paste:

```
ENV_BRANCH=1.35
ENV_MONOREPO=traefik_stack4

# Setup alpine node and docker swarm

source <(curl -s https://raw.githubusercontent.com/pascalandy/docker-stack-this/1.34/play-with-docker-init/alpine-setup-swarm-is-set.sh) && sleep 1 && \
git checkout "$ENV_BRANCH" && \
cd "$ENV_MONOREPO" && \
./runup.sh;
```

ISSUE HERE.

ISSUE HERE. 

ISSUE HERE. 

ISSUE HERE. 

ISSUE HERE. 

---

## What is Traefik?
[Traefik](https://docs.traefik.io/configuration/backends/docker/) is a powerful layer 7 reverse proxy. Once running, the proxy will give you access to many web apps. I think this is a solid use cases to understand how this reverse-proxy works.

#### Traefik version 
In `toolproxy.yml` look for something like `traefik:1.4.2`.

In some mono-repo I **my own traefik image**. Feel free to use the official images. It will not break anything.

## Backlog
Here is what’s missing to make this stack perfect?
 
- Secure traefik dashboard
- Use SSL endpoints (ACME)
- Fix the need to use a trailing slash `/` at the end of Portainer service

#### Something is off? Please let me know.
I consider this README crystal clear. If there is anything that I could improve, please let me know and make sure to review the [contributing doc](../CONTRIBUTING.md).

## Shameless promotion :-p
Looking to **kick-start your website** (static page + a CMS) ? Take a look at [play-with-ghost](http://play-with-ghost.com/) (another project I shared). It allows you to see and edit websites made with **Ghost**. In short, you can try Ghost on the spot without having to sign up! Just use the dummy email & password provided.

## Wanna help?
If you have solid skills 🤓 with Docker Swarm, Linux bash and the gang and you’re looking to help a startup to launch a solid project, I would love to get to know you. Buzz me 👋 on Twitter [@askpascalandy](https://twitter.com/askpascalandy). You can see the things that are done and the things we have to do [here](http://firepress.org/blog/technical-challenges-we-are-facing-now/).

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