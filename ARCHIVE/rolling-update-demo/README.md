## Introduction

work in progress 2018-05-29_00h20
Not stable

---

This mono repo is based on `traefik_stack5`. Please make sure to understand what it does as I won’t re-explain what it does here.

## Start here
1. Go to http://labs.play-with-docker.com/ 
2. Create **one instance*. Wait for the node to provision
3. On **node1**, copy paste:

```
ENV_BRANCH=1.45
ENV_MONOREPO=rolling-update-demo

# Setup alpine node and docker swarm

source <(curl -s https://raw.githubusercontent.com/pascalandy/docker-stack-this/master/play-with-docker-init/alpine-setup.sh) && sleep 2 && \
git checkout "$ENV_BRANCH" && \
cd "$ENV_MONOREPO" && \
./runup.sh;
```