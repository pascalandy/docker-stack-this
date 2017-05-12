# Context
I believe we need ONE common way to share Docker stacks over the open-source community. Thanks to **play-with-docker** (PWD) it’s now easy to do. It’s even better than locally!

### Create a cluster
Create a two nodes session on http://labs.play-with-docker.com/

##### On each node:** (optional)
```
apk update && apk upgrade && apk add nano curl bash git
```

##### Leader | node1
```
docker swarm init --advertise-addr=$(hostname -i)
```

##### Leader | node2
Join node2 to the cluster from commands docker swarm init generated. **Warning**: You need to reformat the command docker has generated for you. Put this command into one single line.

BEFORE:
```
docker swarm join \
    --token SWMTKN-1-58x1bngt2esj8enkr0q71bn98t3vn96cqld9ay9tbe06urvsmt-
7ko3krnrglwj9x90lt7vsimym \
    10.0.25.3:2377
```

AFTER:

```
docker swarm join --token SWMTKN-1-58x1bngt2esj8enkr0q71bn98t3vn96cqld9ay9tbe06urvsmt-7ko3krnrglwj9x90lt7vsimym 10.0.25.3:2377
```

### Git clone | node1
```
git clone https://github.com/pascalandy/docker-stack-this.git
cd docker-stack-this/traefik-basic
```

### Create network | Leader
```
docker network create --driver overlay --subnet 10.10.10.0/24 --opt encrypted ntw_front
```

### Deploy all

```
docker stack deploy traefik -c traefik.yml
docker stack deploy who1 -c who1.yml
docker stack deploy who2 -c who2.yml
docker stack deploy caddy1 -c caddy1.yml
docker stack deploy nginx1 -c nginx1.yml
```

### Scrap all

```
docker stack rm traefik
docker stack rm who1
docker stack rm who2
docker stack rm caddy1
docker stack rm nginx1
docker network rm ntw_front
```  

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

### See apps online
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