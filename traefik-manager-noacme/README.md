## General Considerations
This project will run those services in just one copy paste command:

- Traefik
- Portainer
- WordPress
- Nginx
- Caddy
- Whoami

You can’t beat this for a demo!

#### What’s special about this directory
This stack does not use ACME (TLS). This project is stable.

I decided to work on this as I still have issues in the project `traefik-manager`. 

## Time to deploy
1. Go to http://labs.play-with-docker.com/ 
2. Create **one instance** and wait for the node to provision
3. On **node1**, copy paste:

```
# Create Swarm
docker swarm init --advertise-addr eth0;

# Install common apps
apk update && apk upgrade && apk add nano curl bash git wget unzip ca-certificates;

# Clone repo
cd /root;
git clone https://github.com/pascalandy/docker-stack-this.git;
cd docker-stack-this;

# Bypass if you are looking for the stable stack  
# else select a branch
git checkout 1.17;

# Go to the actual project
cd traefik-manager-noacme;
echo; pwd; echo; ls -AlhF; echo; du -sh *; echo; du -sh;

# Make script executable
chmod +x runup;
chmod +x rundown;
chmod +x runctop;

# List nodes
docker node ls;

# Launch all services
./runup;
```

This is it!!! Now it’s time to…

## Confirm that Traefik and the gang are running
1. The script `runup` run `docker service ls` at few times automatically to show you the status of the stacks.

2. After a while (about 25 sec) we see the logs from Traefik. Do `CTRL-C` to quits Traefik’s log and return to the terminal’s prompt.

3. Click on `9090` to see **Traefik dashboard**. We see all the services that run behind traefik.

4. Click on `80`. We have access to Wordpress (stateful). By default Wordpress redirect to `/wp-admin/install.php`.

5. At the end of the URL generate by play-with-ghost on port 80, just add `who1/` or `/who2/` or `/who3/` or `/portainer/`.

#### Example
```
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/who1/
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/who2/
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/portainer/
http://pwd10-0-7-3-80.host1.labs.play-with-docker.com/wordpress/
```

**WARNING**! Portainer absolutly needs a slash `/` at the end of the path. There is something to tweak with Traefik Labels in order for it to accept the proxy the request without the slash `/` at the end.

#### Web apps details:
- **/** = [caddy](https://hub.docker.com/r/abiosoft/caddy/)
- **who1/** = [nginx](https://hub.docker.com/_/nginx/)
- **who2/** = [whoami](https://hub.docker.com/r/emilevauge/whoami/)
- **portainer/** = [portainer](https://hub.docker.com/r/portainer/portainer//)
- **wordpress/** = [wordpress](https://hub.docker.com/_/wordpress/)

Warning, there is an [issue](https://github.com/pascalandy/docker-stack-this/issues/8) about wordpress.

#### All commands
In the active path, just execute those bash-scripts:

- `./runup`
- `./rundown`
- `./runctop`

See for yourself that Wordpress data is persistent even after shutting down services.

**Bonus**! `ctop` runs as a simple docker run :)

#### What is Traefik?
[Traefik](https://docs.traefik.io/configuration/backends/docker/) is a powerful layer 7 reverse proxy. Once running, the proxy will give you access to many web apps. I think this is a solid use cases to understand how this reverse-proxy works.

#### Traefik version 
In `toolproxy.yml` look for something like `traefik:1.4.0-rc3`.

## Backlog

Here is what’s missing to make this stack perfect?
 
- Secure traefik dashboard
- Use SSL endpoints (ACME)
- Fix the need to use a trailing slash `/` at the end of Portainer service
- Use ntw_back network for DB

## Something looks off? Please let me know.
I consider this README crystal clear. If there is anything that I could improve, please [let me know via an issue](https://github.com/pascalandy/docker-stack-this/issues).

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