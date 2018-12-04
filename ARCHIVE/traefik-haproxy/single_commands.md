
### Create Swarm

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
```

###  List nodes

```
docker node ls
```

###  Clone repo

```
apk update && apk upgrade && apk add nano curl bash git
cd /root
git clone https://github.com/pascalandy/docker-stack-this.git
cd docker-stack-this/traefik-haproxy
```

### Create network | node1

```
docker network create --driver overlay --subnet 10.11.10.0/24 --opt encrypted ntw_front
docker network create --driver overlay --subnet 10.12.10.0/24 --opt encrypted ntw_socketproxy
docker network ls | grep "ntw_"
```

### Deploy socketproxy

```
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

### Deploy Traefik

```
docker service create \
--name traefik \
--network ntw_front \
--network ntw_socketproxy \
--mode global \
-p 80:80 \
-p 443:443 \
-p 8080:8080 \
--constraint 'node.role==worker' \
traefik:1.2.3-alpine \
--docker \
--docker.swarmmode \
--docker.endpoint=tcp://socketproxy:2375 \
--web
```

### Checkpoint

`docker service ls` should looks like:

```
root@host:~/docker-stack-this/traefik-haproxy# docker service ls
ID                  NAME                MODE                REPLICAS            IMAGE                                  PORTS
jnn673qvn4fg        socketproxy         global              3/3                 tecnativa/docker-socket-proxy:latest
xa6vwcxol81h        traefik             global              2/2                 traefik:1.2.3-alpine                   *:80->80/tcp,*:443->443/tcp,*:8080->8080/tcp
```

###  Deploy web apps

```
docker stack deploy who -c who.yml
docker stack deploy caddy -c caddy.yml
docker stack deploy nginx -c nginx.yml
```

### Checkpoint

`docker service ls` should looks like:

```
root@host:~/docker-stack-this/traefik-haproxy# docker service ls
ID                  NAME                MODE                REPLICAS            IMAGE                                  PORTS
2n1ouccsjq46        nginx_nginx2        replicated          3/3                 nginx:1.13.0-alpine
d6sq2bkf29es        caddy_caddy2        replicated          3/3                 abiosoft/caddy:0.10.2
glzicabhj726        who_who1            replicated          3/3                 emilevauge/whoami:latest
jnn673qvn4fg        socketproxy         global              3/3                 tecnativa/docker-socket-proxy:latest
jqt6kzya136p        who_who2            replicated          3/3                 emilevauge/whoami:latest
p9wl0p0ly1ax        caddy_caddy1        replicated          3/3                 abiosoft/caddy:0.10.2
sd7h5f3mcw7t        nginx_nginx1        replicated          3/3                 nginx:1.13.0-alpine
xa6vwcxol81h        traefik             global              2/2                 traefik:1.2.3-alpine                   *:80->80/tcp,*:443->443/tcp,*:8080->8080/tcp
```

### See these web apps online

Click on port 8080 from the PWD gui. It will allow you the get the unique URL domain for this session.

```
http://pwd10_0_25_3-8080.host2.labs.play-with-docker.com/dashboard/#/
                   #____# On PWD pay attention

http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/webapp-who-a/
                   #__# On PWD pay attention

http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/webapp-who-b/
                   #__# On PWD pay attention

http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/webapp-caddy-a/
                   #__# On PWD pay attention

http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/webapp-caddy-b/
                   #__# On PWD pay attention
                   
http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/webapp-nginx-a/
                   #__# On PWD pay attention
                   
http://pwd10_0_25_3-80.host2.labs.play-with-docker.com/webapp-nginx-b/
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

docker service update -d=false --replicas 5 who_who
    # OLD WAY docker service scale who_who=5

curl http://localhost:8080/api/providers
curl http://localhost/caddy1/ 
```

### Scrap all

```
docker service rm socketproxy
docker service rm traefik
docker stack rm who
docker stack rm caddy
docker stack rm nginx

docker network rm ntw_front
docker network rm ntw_socketproxy
```

Containerize carefully!
