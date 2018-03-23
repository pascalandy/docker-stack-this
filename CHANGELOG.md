
# Changelog

## bump to 1.38

## bump to 1.37

commit 4afb9e0818135eb649b94d43655f59526018a446
Author: Pascal Andy <pascal@firepress.org>
Date:   Thu Feb 1 22:50:52 2018 -0500

    portainer update 1.16.1

commit 5154e9ce060159f3c663dc4812b6bb1ac623dc6e
Author: Pascal Andy <pascal@firepress.org>
Date:   Thu Feb 1 22:44:22 2018 -0500

    update to traefik 1.5.1-alpine

commit 42137064cb24055599aae9171721a488b3f8b957
Author: Pascal Andy <pascal@firepress.org>
Date:   Sun Jan 14 22:10:52 2018 -0500

    PASSED testing traefik 1.5.0-rc4

commit aae7d5ebc3a96d3a4336fc34c1ced371c5199ba0
Author: Pascal Andy <pascal@firepress.org>
Date:   Sun Jan 14 22:08:16 2018 -0500

    testing traefik 1.5.0-rc4 /02

commit fa2d386b281bdc61d9b20ea81021baa0109cf7d7
Author: Pascal Andy <pascal@firepress.org>
Date:   Sun Jan 14 22:05:28 2018 -0500

    testing traefik 1.5.0-rc4 /01

Signed-off-by: Pascal Andy <pascal@firepress.org>

## 1.36

**Impact monorepo**: `traefik_stack5`

Update to traefik:1.5.0-rc3-alpine

## 1.35

**Impact monorepo**: `traefik_stack5`

moving to main project to stack5

## 1.34

**Impact monorepo**: `traefik_stack4`

Testing stack4 but it’s a fail

## 1.33

**Impact monorepo**: `traefik_stack1`

- update to traefik 1.4.5. Testing the bug that is ruining my life since months! https://github.com/containous/traefik/issues/2402#issuecomment-350257657
- Tried nextcloud but I drop the project

## 1.32

- working on traefik_stack3 but it’s not stable

## 1.31

**Impact monorepo**: `traefik_stack1`

- update to IMG traefikfire:1.4.1

## 1.30

**Impact monorepo**: `traefik_stack1`

- remove backend. The idea is that because swarm assigns name like caddy.1 maybe it’s why I have random issues when I update my service in prod.

## 1.29

**Impact monorepo**: `traefik_stack2`

- Mostly readme updates

## 1.28

**Impact monorepo**: `traefik_stack2`

- provision pwg host via a script which will be universal for all monorepo

## 1.27

**Impact monorepo**: `traefik_stack2`

- adding new monorepo `traefik_stack2`
- working on `play-with-docker-init`

## 1.26

**Impact monorepo**: `traefik_stack1`

- wip

## 1.25

**Impact monorepo**: `traefik_stack1`

- Clean up the README at the root

## 1.24

**Impact monorepo**: `traefik_stack1`

- Running Traefik 1.4.0
- optimised socat (no bash)
- `traefik_stack1` is based on `traefik-manager-noacme`
- Minor readme

---

## 1.23

**Impact monorepo**: `traefik-manager-noacme`

I screwd up my squash merge… Sorry for the mess in the master branch.

- Explicite visibility of toolproxy-alone.yml + toolproxy-withsocat.yml
- using toolproxy-withsocat.yml by default
- Using my traefik image 1.3.8-alpine + Dockerfile

### WIP
- troed traefik 1.4, but it’s failing

---

## 1.22

**Impact monorepo**: `traefik-manager-noacme`

- tried traefik with consul, but it’s a fail

---

## 1.21

**Impact monorepo**: `traefik-manager-noacme`

- readme updates
- minor stuff

---

## 1.20

**Impact monorepo**: `traefik-manager-noacme`

- readme updates

---

## 1.19

**Impact monorepo**: `traefik-manager-noacme`

- Use socat to access Docker API
- Use the stable version traefik:1.3.8-alpine
- Traefik do not need a traefik.toml :)
- Traefik do not need to mount any volumes!
- clean up older file into DIR z-archive
- Removed WordPress and Mysql

---

## 1.18

**Impact monorepo**: `traefik-manager-noacme`

- rename stacks
- simplify the readme experience

---

## 1.17

**Impact monorepo**: `traefik-manager-noacme`

- using traefik 1.4.0-rc4
- when we click on button `80` a static page is now rendering
- added cute pages
- remove elk and elastic directories
- open an issue regarding wordpress

---

## 1.16

**Impact monorepo**: `traefik-manager-noacme`

- minor changes
- test elastic stack. drop as it’s too complicated for me

---

## 1.15

**Impact monorepo**: `traefik-manager-noacme`

- added wordpress & mysql stack

---

## 1.14

**Impact monorepo**: `traefik-manager-noacme`

- reservation / limit for memory & CPU on all services
- see the result via runctop

---

## 1.13

**Impact monorepo**: `traefik-manager-noacme`

- fix portainer path
- minor fixes

---

## 1.12

**Impact monorepo**: `traefik-manager-noacme`

- Minor changes
- Added runctop

---

## 1.11

**Impact monorepo**: `traefik-manager-noacme`

- Added wordpress
- Added portainer (not stable yet)
Issue opened: https://github.com/portainer/portainer-compose/issues/12

---

## 1.10
**Impact monorepo**: `traefik-manager-noacme`

- minor changes

---

## 1.09

**Impact monorepo**: `traefik-manager-noacme`

- As an DevOps hero, I want to using traefik without TLS or ACME in order to avoid bug I don’t understand

---

## 1.08

Add projects into DIR exploration

