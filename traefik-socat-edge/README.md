# Quickly try this stack

I consider this README crystal clear. I made it blazing-ish-fast to try out. If there is anything that I could improve, please buzz me.

### Create a cluster
Create a two nodes on http://labs.play-with-docker.com/

##### On each node:** (optional)
```
apk update && apk upgrade && apk add nano curl bash git
```

##### Init our 5 nodes cluster

This script will create 3 leader + 2 workers

1. Create five instances.
2. Copy paste this script on node1

```
docker swarm init --advertise-addr eth0
TOKEN_LEAD=$(docker swarm join-token -q manager)
TOKEN_WORK=$(docker swarm join-token -q worker)
for N in $(seq 2 3); do
  DOCKER_HOST=tcp://node$N:2375 docker swarm join --token $TOKEN_LEAD node1:2377
done
for N in $(seq 4 5); do
  DOCKER_HOST=tcp://node$N:2375 docker swarm join --token $TOKEN_WORK node1:2377
done
docker node ls
```

##### Output

Now we can feel like a rock stars. Time to smash some guitars.

```
$ docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
h864xweuf9uwtvc1eu7h5pkv7     node3               Ready               Active              Reachable
nxb74iw3oyum2ps46ksf4h5rv     node4               Ready               Active
ponk878u9rb8zzskwifarju5a     node2               Ready               Active              Reachable
w3jwdlb16lc64khbusgpbfd7l *   node1               Ready               Active              Leader
wzyhhn02zl0hlw8axcjuqg269     node5               Ready               Active
[node1] (local) root@10.0.250.3 ~
```

### Clone repo | node1
```
git clone https://github.com/pascalandy/docker-stack-this.git
cd docker-stack-this/traefik-socat-edge
```

### Create network | node1
```
docker network create --driver overlay --subnet 10.11.10.0/24 --opt encrypted ntw_front

docker network create --driver overlay --subnet 10.12.10.0/24 --opt encrypted ntw_socketproxy
```

### Deploy all

docker service rm socketproxy && \
\
docker service create \
--name socketproxy \
--network ntw_socketproxy \
--mode global \
--mount "type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock" \
--constraint 'node.role==manager' \
rancher/socat-docker

docker service rm traefik && \
\
docker service create \
--name traefik \
--network ntw_front \
--network ntw_socketproxy \
--mode global \
-p 80:80 \
-p 443:443 \
-p 8080:8080 \
--constraint 'node.role==worker' \
traefik \
--docker \
--docker.swarmmode \
--docker.endpoint=tcp://socketproxy:2375 \
--web

```
docker stack deploy traefik -c traefik.yml

docker stack deploy who1 -c who1.yml
docker stack deploy who2 -c who2.yml
docker stack deploy caddy1 -c caddy1.yml
docker stack deploy nginx1 -c nginx1.yml
```

### See these web apps online
Click on port 8080 from the PWD Gui. It will allow you the get the unique URL domain for this session.

<img width="1252" alt="pwd" src="https://cloud.githubusercontent.com/assets/6694151/25980591/97a1307a-369d-11e7-96b7-5222dea0756d.png">

```
http://pwd10_0_25_3-8080.host2.labs.play-with-docker.com/dashboard/#/
                   #____# On PWD pay attention

http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/who1/
                   #__# On PWD pay attention

http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/who2/
                   #__# On PWD pay attention

http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/caddy1/
                   #__# On PWD pay attention

http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/nginx1/
                   #__# On PWD pay attention
```

<img width="1247" alt="screen shot 2017-05-11 at 11 14 50 pm" src="https://cloud.githubusercontent.com/assets/6694151/25980916/e7f42c7e-369f-11e7-9890-6be8013179db.png">

<img width="1257" alt="screen shot 2017-05-11 at 11 15 08 pm" src="https://cloud.githubusercontent.com/assets/6694151/25980924/efbc5da0-369f-11e7-8d05-af5f86db0ee9.png">

<img width="1256" alt="screen shot 2017-05-11 at 11 15 15 pm" src="https://cloud.githubusercontent.com/assets/6694151/25980927/f725d63e-369f-11e7-92d4-2ca6a295a59b.png">

<img width="1254" alt="screen shot 2017-05-11 at 11 15 40 pm" src="https://cloud.githubusercontent.com/assets/6694151/25980932/fe0db1e2-369f-11e7-80bf-9d43725299da.png">

<img width="1254" alt="screen shot 2017-05-11 at 11 15 43 pm" src="https://cloud.githubusercontent.com/assets/6694151/25980937/030e9e04-36a0-11e7-8063-c703e0aba0ef.png">

### Other useful commands

```
docker network ls && \
docker stack ls && \
docker stack ps traefik

docker network inspect ntw_front
docker network inspect ntw_front | grep who1

docker service logs --tail=10 traefik_traefik
docker service logs -f traefik_traefik

docker service ps traefik_traefik

docker service update -d=false --replicas 5 who1_who1
    # OLD WAY docker service scale who1_who1=5

curl http://localhost:8080/api/providers
curl http://localhost/caddy1/ 
```

### Scrap all

```
docker stack rm traefik
docker stack rm who1
docker stack rm who2
docker stack rm caddy1
docker stack rm nginx1

docker network rm ntw_front
docker network rm ntw_socketproxy
```

**P.S.** If you have solid skills 🤓 with Docker Swarm, Bash (and the gang)… plus you would love 💚 to help a startup to launch 🔥 a solid project, I would love to get to know you 🍻. Buzz me 👋 on Twitter [@askpascalandy](https://twitter.com/askpascalandy). I’m looking for bright and caring people to join in this journey 🌇.

Here, I [shared the details](http://firepress.org/blog/technical-challenges-we-are-facing-now/) of the challenges I’m facing at the moment.

Conternerize carefully!

```
 ____                     _      _              _
|  _ \ __ _ ___  ___ __ _| |    / \   _ __   __| |_   _
| |_) / _` / __|/ __/ _` | |   / _ \ | '_ \ / _` | | | |
|  __/ (_| \__ \ (_| (_| | |  / ___ \| | | | (_| | |_| |
|_|   \__,_|___/\___\__,_|_| /_/   \_\_| |_|\__,_|\__, |
                                                  |___/
```

