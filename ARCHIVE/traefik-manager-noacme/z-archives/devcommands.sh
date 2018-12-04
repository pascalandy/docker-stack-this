docker swarm init --advertise-addr $(hostname -i); docker node ls;
# Install common apps
apk update && apk upgrade && apk add nano curl bash git wget unzip ca-certificates;

# Clone repo
cd /root;
git clone https://github.com/pascalandy/docker-stack-this.git;
cd docker-stack-this;
git checkout 1.23;

# Go to the actual project
cd traefik-manager-noacme; echo; pwd; echo; ls -AlhF;
# Make scripts executable
chmod +x runup; chmod +x rundown; chmod +x runctop;
# Run the stack
./runup;


# — — — # — — — # — — — #=

docker swarm init --advertise-addr $(hostname -i); docker node ls;

# Install common apps
apk update && apk upgrade && apk add nano curl bash git wget unzip ca-certificates;

# Clone repo
cd /root;
git clone https://github.com/chmod666org/traefik-stack.git
cd traefik-stack;

# Run the stack
if [ ! "$(docker network ls --filter name=traefik-net -q)" ];then
  docker network create --driver overlay --subnet 10.11.10.0/24 --opt encrypted traefik-net
  sleep 2
fi

DOMAIN=domain.com docker stack deploy --compose-file traefik.yml traefik