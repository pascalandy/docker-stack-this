# Quickly try this stack

I consider this README crystal clear. It should be quick for you to try the elements of this repo. If there is anything that I could improve, please let me know.

Source: https://github.com/pascalandy/docker-stack-this

### Why using a traefik + socketproxy?
Listen to this: https://cl.ly/1z0Q3a0K1M15

### Create a 5 nodes cluster

On http://labs.play-with-docker.com/ create five instances.

Copy paste this script on `node1`. This will create 3 leaders + 2 workers.

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

##### On each nodes:

Optional but I always need theses :-p

```
apk update && apk upgrade && apk add nano curl bash git
```

Now that we feel like a rock stars, it’s time to break stuff.

### Clone repo | node1

```
cd /root
git clone https://github.com/pascalandy/docker-stack-this.git
cd docker-stack-this/traefik-socat
```

### Create network | node1

```
docker network create --driver overlay --subnet 10.11.10.0/24 --opt encrypted ntw_front

docker network create --driver overlay --subnet 10.12.10.0/24 --opt encrypted ntw_socketproxy
```

### Deploy traefik & socketproxy

##### socketproxy

```
docker service rm socketproxy && \
\
docker service create \
--name socketproxy \
--network ntw_socketproxy \
--mode global \
--mount "type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock" \
--constraint 'node.role==manager' \
-e CONTAINERS=1 \
-e NETWORKS=1 \
-e SERVICES=1 \
-e SWARM=1 \
-e TASKS=1 \
tecnativa/docker-socket-proxy
```

See the [option #2](https://github.com/pascalandy/docker-stack-this/blob/master/traefik-socat/option2.md) which use `rancher/socat`.

##### Traefik

```
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

###  Deploy web apps

```
docker stack deploy who -c who.yml
docker stack deploy caddy -c caddy.yml
docker stack deploy nginx -c nginx.yml
```

### See these web apps online

Click on port 8080 from the PWD gui. It will allow you the get the unique URL domain for this session.

```
http://pwd10_0_25_3-8080.host2.labs.play-with-docker.com/dashboard/#/
                   #____# On PWD pay attention

http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/who1/
                   #__# On PWD pay attention

http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/who2/
                   #__# On PWD pay attention

http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/caddy1/
                   #__# On PWD pay attention

http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/caddy2/
                   #__# On PWD pay attention
                   
http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/nginx1/
                   #__# On PWD pay attention
                   
http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/nginx2/
                   #__# On PWD pay attention
```

<img width="1252" alt="pwd" src="https://cloud.githubusercontent.com/assets/6694151/25980591/97a1307a-369d-11e7-96b7-5222dea0756d.png">

<img width="1247" alt="screen shot 2017-05-11 at 11 14 50 pm" src="https://cloud.githubusercontent.com/assets/6694151/25980916/e7f42c7e-369f-11e7-9890-6be8013179db.png">

<img width="1257" alt="screen shot 2017-05-11 at 11 15 08 pm" src="https://cloud.githubusercontent.com/assets/6694151/25980924/efbc5da0-369f-11e7-8d05-af5f86db0ee9.png">

<img width="1256" alt="screen shot 2017-05-11 at 11 15 15 pm" src="https://cloud.githubusercontent.com/assets/6694151/25980927/f725d63e-369f-11e7-92d4-2ca6a295a59b.png">

<img width="1254" alt="screen shot 2017-05-11 at 11 15 40 pm" src="https://cloud.githubusercontent.com/assets/6694151/25980932/fe0db1e2-369f-11e7-80bf-9d43725299da.png">

<img width="1254" alt="screen shot 2017-05-11 at 11 15 43 pm" src="https://cloud.githubusercontent.com/assets/6694151/25980937/030e9e04-36a0-11e7-8063-c703e0aba0ef.png">

*(no screenshot for nginx2 & caddy2)*

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
docker stack rm who
docker stack rm caddy
docker stack rm nginx

docker network rm ntw_front
docker network rm ntw_socketproxy
```

**P.S.** If you have solid skills 🤓 with Docker Swarm, Bash (and the gang)… plus you would love 💚 to help a startup to launch 🔥 a solid project, I would love to get to know you 🍻. Buzz me 👋 on Twitter [@askpascalandy](https://twitter.com/askpascalandy). I’m looking for bright and caring people to join in this journey 🌇.

Here, I [shared the details](http://firepress.org/blog/technical-challenges-we-are-facing-now/) of the challenges I’m facing at the moment.

Containerize carefully!

```
 ____                     _      _              _
|  _ \ __ _ ___  ___ __ _| |    / \   _ __   __| |_   _
| |_) / _` / __|/ __/ _` | |   / _ \ | '_ \ / _` | | | |
|  __/ (_| \__ \ (_| (_| | |  / ___ \| | | | (_| | |_| |
|_|   \__,_|___/\___\__,_|_| /_/   \_\_| |_|\__,_|\__, |
                                                  |___/
```

