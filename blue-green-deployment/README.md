# Quick trial of this Docker Stack

WORK IN PROGRESS - 2017-05-16_21h10

Blue-green deployment is a technique that reduces downtime and risk by running two identical production environments called Blue and Green. At any time, only one of the environments is live, with the live environment serving all production traffic. For this example, Blue is currently live and Green is idle. [Source](https://docs.cloudfoundry.org/devguide/deploy-apps/blue-green.html).

At the moment, Docker Swarm does not support `real`, Blue-green deployment. You service will shut for few seconds.

## Prerequisite

Run this [Docker Stack](https://github.com/pascalandy/docker-stack-this/tree/master/traefik-haproxy)

## Strategy

You can [see](https://github.com/pascalandy/docker-stack-this/blob/master/traefik-haproxy/caddy.yml#L4), this service `webapp-caddy-a`. We will think of it as implicitly blue.

What we will do, is the create a service `webapp-caddy-a-green` and ensure trafic points to it like it’s `webapp-caddy-a`.

docker service 


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

