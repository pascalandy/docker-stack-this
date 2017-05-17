# Quickly try this stack

I consider this README crystal clear. It should be quick for you to try the elements of this repo. If there is anything that I could improve, please let me know. **Source**: https://github.com/pascalandy/docker-stack-this

**Why using a traefik + socketproxy**?
Listen to this: https://cl.ly/1z0Q3a0K1M15

## Setup

On http://labs.play-with-docker.com/ create five instances.
Wait about 30sec for after node5 is deploy to ensure the machines have network,

Execute: `./setup`

This will do 3 things:
- This will create 3 leaders + 2 workers.
- Clone repo && cd into the right directory
- run ./start

Enjoy!

## 2) Start and stop

Execute: `./start` and `./stop`

To see screen shots and each commands one by one, see [single_commands.md](https://github.com/pascalandy/docker-stack-this/blob/master/traefik-haproxy/single_commands.md)

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

