## Goal

The main goal is to create the **easiest** and **quickest** docker stack available around the **Docker Swarm ecosystem**. I really wished I had this when I started (while back when docker-compose was called fig).

- First, launch a session on [play-with-docker](https://labs.play-with-docker.com/)
- Launch a stack like 'traefik_stack5`. Copy-paste this and see the magic:

```
ENV_BRANCH=1.41
ENV_MONOREPO=traefik_stack5

# Setup alpine node and docker swarm

source <(curl -s https://raw.githubusercontent.com/pascalandy/docker-stack-this/master/play-with-docker-init/alpine-setup.sh) && sleep 2 && \
git checkout "$ENV_BRANCH" && \
cd "$ENV_MONOREPO" && \
./runup.sh;
```

- Now you are up and running. Enjoy!

I hope the community will use this repo as a base project to demo other stuff like CMS, Log, Monitoring, Volume and Storage, Dbs, Benchmark tools and other cool applications we love to use in Docker.

To accomplish this, we put together the power of :

- play-with-docker (#pwg)
- Docker Swarm mode
- Docker stacks

## Start here

The most interesting stack at the moment is: [traefik_stack5](./traefik_stack5)

This project is a **monorepo** (or an aggregation of mini-projects). Just navigate the directories! 

**Quick links**
  
- [CHANGELOG](./CHANGELOG.md)
- [LICENCE](./LICENCE.md)
- [CONTRIBUTING](./CONTRIBUTING.md)
- [CODE_OF_CONDUCT](./CODE_OF_CONDUCT.md)
- [My Twitter](https://twitter.com/askpascalandy)