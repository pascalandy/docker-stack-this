
# Changelog

## 1.49
- update to traefik 1.7.5
- rebuild socatproxy from alpine:3.8
- Add a ntw_proxy network
- various code cleaning
- removed DIR traefik_stack6-wip

## 1.48
- Fix trailing ‘/‘ issue for portainer

## 1.47
- bump to traefik 1.6.6

## 1.47
- bump to traefik 1.6.5

## 1.45
- 60dc878c bump to traefik 1.6.4

## 1.44

- we still use portainer 1.16.5
	- 2541361e portainer 1.17.1 is not stable
- 58e236ed portainer major refactoring /C
- could not run caddy 0.11.0
	- 3f7608a1 rollback caddy:0.10.14
- 2c5bd542 bump to portainer:1.17.1
- 19a757d0 bump to traefik:1.6.2-alpine

## 1.43

could not work under branch 1.43 weird …

## 1.42

- update to traefik 1.6.0
- update to nginx 1.13.12
- update caddy to 1.10.14
- update README
- well tested on https://labs.play-with-docker.com/

b66611b4 READme update
eb492fef READme update
98a54757 READme update
55cb5a1b READme update
1408365b READme update
93a1d91f READme update
3c587c58 bump to caddy:0.10.14
4c614091 bump to caddy:0.10.14
60081cf7 bump to nginx:1.13.12-alpine
f3be35c4 READme update
653be7b7 bump to traefik:1.6.0-alpine
d2449e7f READme up
4aa41bdf wip WordPress /f
4510e87e wip WordPress /e
1aa0500c wip WordPress /d
25e0ed76 wip WordPress /c
d4956c4a wip WordPress /b
26fd5d72 wip WordPress
ac3b2856 minor updates

## bump to 1.41

- caddy 0.10.12
- Testing wordpress via traefik_stack6-wip
- update to portainer 1.16.5

## bump to 1.40

- update to nginx 1.13.10-alpine
- update to caddy 0.10.11

## bump to 1.38

commit 8753f097247200e666355c2e4f6d8df83b6f093b
Author: Pascal Andy <pascal@firepress.org>
Date:   Thu Mar 22 22:08:04 2018 -0400

    chagelog update

commit f25551c5fa6f2a8eace9d4d25d369457829dcc3c
Author: Pascal Andy <pascal@firepress.org>
Date:   Thu Mar 22 22:02:50 2018 -0400

    update README

commit 9c0ca9b2674e6993c6746930055dbab96bf5281c
Author: Pascal Andy <pascal@firepress.org>
Date:   Thu Mar 22 22:01:34 2018 -0400

    update traefik 1.5.4-alpine AND portainer 1.16.4

commit b2f19135c8308d60e8422795298c985156189313
Author: Pascal Andy <pascal@firepress.org>
Date:   Sat Mar 3 11:17:40 2018 -0500

    bump to portainer 1.16.3

commit d483009ec5693ed2bf814ca8e06df84ec3676a7c
Author: Pascal Andy <pascal@firepress.org>
Date:   Mon Feb 26 22:31:08 2018 -0500

    upgrade to 1.5.2

Signed-off-by: Pascal Andy <pascal@firepress.org>

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

