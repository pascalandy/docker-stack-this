## Introduction

**Status**: work in progress

## Time to deploy
1. Go to http://labs.play-with-docker.com/ 
2. Create **one instance** and wait for the node to provision
3. On **node1**, copy paste:

```
# Create Swarm
docker swarm init --advertise-addr $(hostname -i); docker node ls;

# Install common apps
apk update && apk upgrade && apk add nano curl bash git wget unzip ca-certificates;

# Clone repo
cd /root;
git clone https://github.com/pascalandy/docker-stack-this.git;
cd docker-stack-this;

git checkout master;

# Go to the actual project
cd traefik-consul; echo; pwd; echo; ls -AlhF;

# Make scripts executable
chmod +x runup.sh; chmod +x rundown.sh;

# Run the stack
./runup.sh;
```

Buggy at this point.