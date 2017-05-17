# Quick trial of this Docker Stack

WORK IN PROGRESS - 2017-05-16_21h10

Blue-green deployment is a technique that reduces downtime and risk by running two identical production environments called Blue and Green. At any time, only one of the environments is live, with the live environment serving all production traffic. For this example, Blue is currently live and Green is idle. [Source](https://docs.cloudfoundry.org/devguide/deploy-apps/blue-green.html).

At the moment, Docker Swarm does not support `real`, Blue-green deployment. You service will shut for few seconds.

## Prerequisite

Run this [Docker Stack](https://github.com/pascalandy/docker-stack-this/tree/master/traefik-haproxy)

## Strategy

You can [see](https://github.com/pascalandy/docker-stack-this/blob/master/traefik-haproxy/caddy.yml#L4), this service `webapp-caddy-a`. 
We will think of it implicitly `blue`..

In this example we want to downgrade from `abiosoft/caddy:0.10.2` to `abiosoft/caddy:0.10.1`

If you simply to this and refresh your browser like a nut, you will see that caddy does not repons for few seconds.

See docker [docs](https://docs.docker.com/engine/swarm/swarm-tutorial/rolling-update/)

docker service update --image abiosoft/caddy:0.10.1 caddy_webapp-caddy-a

But we know better.



# — — — # — — — # — — — #


What we will do, is the create a NEW service called `webapp-caddy-a-green`.
We will also ensure trafic points to it like it’s `webapp-caddy-a`.

docker service create \
--name caddy_webapp-caddy-a-green \
--network ntw_front \
--replicas 1 \
--constraint node.role==worker \
--label traefik.frontend.rule=PathPrefixStrip:/webapp-caddy-a \
--label traefik.backend=webapp-caddy-a \
--label traefik.docker.network=ntw_front \
--label traefik.port=2015 \
--health-start-period=90s \
abiosoft/caddy:0.10.1 && \
docker service ls

docker service rm caddy_webapp-caddy-a

Here, we expect NO downtime. Traefik redirect all traefik to container `caddy_webapp-caddy-a-green`.

But there is a downtime

docker service create \
--name caddy_webapp-caddy-a \
--network ntw_front \
--replicas 1 \
--constraint node.role==worker \
--label traefik.frontend.rule=PathPrefixStrip:/webapp-caddy-a \
--label traefik.backend=webapp-caddy-a \
--label traefik.docker.network=ntw_front \
--label traefik.port=2015 \
--health-start-period=90s \
abiosoft/caddy:0.10.1 && \
docker service ls

docker service rm caddy_webapp-caddy-a-green

# — — — # — — — # — — — #

docker service update -d=false --image abiosoft/caddy:0.10.2 caddy_webapp-caddy-a
docker service update -d=false --image abiosoft/caddy:0.10.1 caddy_webapp-caddy-a

caddy_webapp-caddy-a

while echo; do
curl -Is --head http://pwd10_0_213_7-80.host1.labs.play-with-docker.com/webapp-caddy-a
sleep 0.5
done





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

