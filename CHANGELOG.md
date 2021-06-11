# CHANGELOG.md - docker-stack-this

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

FirePress Public Roadmap:
https://trello.com/b/0fCwwzqc/firepress-public-roadmap

Based on this template:
https://gist.github.com/pascalandy/af709db02d3fe132a3e6f1c11b934fe4

# STATUS TEMPLATE
### ⚡️ Updates
### 🚀 Added (new feat.)
### 🐛 Fix bug
### 🛑 Removed
### 🔑 Security

---

# Releases

## 4.2.0 (2021-06-11)
### ⚡️ Updates
- [8383f52](https://github.com/pascalandy/docker-stack-this/commit/8383f52) update to traefik:1.7.30-alpine

### 🔍 Compare
- ... with previous release: [4.1.0 <> 4.2.0](https://github.com/pascalandy/docker-stack-this/compare/4.1.0...4.2.0)

## 4.1.0 (2021-04-04)
### ⚡️ Updates
- [065c03e](https://github.com/pascalandy/docker-stack-this/commit/065c03e) Update docker-stack-this to version 4.1.0 /Dockerfile
- [f7cd8ae](https://github.com/pascalandy/docker-stack-this/commit/f7cd8ae) update to traefik:1.7.28
- [e824b35](https://github.com/pascalandy/docker-stack-this/commit/e824b35) Add FLAG ‘NODE 1’
- [c9a806b](https://github.com/pascalandy/docker-stack-this/commit/c9a806b) update README
- [cfc7294](https://github.com/pascalandy/docker-stack-this/commit/cfc7294) basic-auth fix
- [eaf9353](https://github.com/pascalandy/docker-stack-this/commit/eaf9353) basic-auth VAR does not work
- [825a51e](https://github.com/pascalandy/docker-stack-this/commit/825a51e) use a VAR basic-auth
- [5962ad1](https://github.com/pascalandy/docker-stack-this/commit/5962ad1) Improve docs about basic-auth
- [54b044e](https://github.com/pascalandy/docker-stack-this/commit/54b044e) basic auth new password
- [dfafeaa](https://github.com/pascalandy/docker-stack-this/commit/dfafeaa) Add auth.basic
- [591356f](https://github.com/pascalandy/docker-stack-this/commit/591356f) remove stgfirexyz
- [51f1421](https://github.com/pascalandy/docker-stack-this/commit/51f1421) add comments
- [2c6129c](https://github.com/pascalandy/docker-stack-this/commit/2c6129c) define sensitive vars
- [9b72b9a](https://github.com/pascalandy/docker-stack-this/commit/9b72b9a) rollback to acme.httpchallenge
- [4bf68e6](https://github.com/pascalandy/docker-stack-this/commit/4bf68e6) add --acme.onhostrule=true
- [5603b8f](https://github.com/pascalandy/docker-stack-this/commit/5603b8f) stgfirexyz wip
- [6ba5a2b](https://github.com/pascalandy/docker-stack-this/commit/6ba5a2b) Init stgfirexyz as nginx
- [bb6c51e](https://github.com/pascalandy/docker-stack-this/commit/bb6c51e) add stgfirefirepresslink /b
- [8fbe8b3](https://github.com/pascalandy/docker-stack-this/commit/8fbe8b3) add stgfirefirepresslink
- [902c7b9](https://github.com/pascalandy/docker-stack-this/commit/902c7b9) DO_TOKEN via var, not a secret
- [02d074b](https://github.com/pascalandy/docker-stack-this/commit/02d074b) add traefikdev /c
- [8fa6bfc](https://github.com/pascalandy/docker-stack-this/commit/8fa6bfc) empty
- [021efed](https://github.com/pascalandy/docker-stack-this/commit/021efed) dnsChallenge with DO /b
- [7247191](https://github.com/pascalandy/docker-stack-this/commit/7247191) Add secret for DO token
- [7a95d2e](https://github.com/pascalandy/docker-stack-this/commit/7a95d2e) dnsChallenge with DO /a

### 🔍 Compare
- ... with previous release: [4.0.0 <> 4.1.0](https://github.com/pascalandy/docker-stack-this/compare/4.0.0...4.1.0)

## 4.0.0 (2020-11-18)
### ⚡️ Updates
- [144ad01](https://github.com/pascalandy/docker-stack-this/commit/144ad01) Major: Traefik manage certs via ACME

### 🔍 Compare
- ... with previous release: [3.1.2 <> 4.0.0](https://github.com/pascalandy/docker-stack-this/compare/3.1.2...4.0.0)

## 3.1.2 (2020-04-27)
### ⚡️ Updates
- [e415fbe](https://github.com/pascalandy/docker-stack-this/commit/e415fbe) Fix changelog

### 🔍 Compare
- ... with previous release: [ <> 3.1.2](https://github.com/pascalandy/docker-stack-this/compare/...3.1.2)

## 3.1.1 (2020-04-27)
### ⚡️ Updates
FIX Changelog

## 3.1.0 (2020-04-27)

Update to traffic 1.7.24

- The directory `traefik_stack6` is not stable (Traefik V2). Tests are in progress.

## 3.0.0
### 🚀 Added (new feat.)
- acefbd7d Update to Traefik V2 / using DIR traefik_stack6 / squashed

## 2.3.2
### ⚡️ Updates
- a171eac Updated to version: 1.7.20
- 1a12f35 copy updates
- 36cba80 reset traefik_stack6 directory
- b3d7e3c Merge branch 'master' into edge

## 2.3.1
### ⚡️ Updates
ee52e50 Add dockerignore
e71e452 update to 1.7.19
703087c update to 1.7.18
d1bdd91 update to 1.7.17
31dc46a update to 1.7.16
2100493 update to 1.7.15
d813a66 update to 1.7.14
7f545f8 rollback from 1.7.13
b2775e3 Testing 1.7.19 /d
c3d4979 Testing 1.7.19 /c
334ed02 Testing 1.7.19 /b
09f154b using branch edge instead of dev when developping
37d1783 better template for gitognore
74fedae update to traefik:1.7.19
c976e59 simple linting
dc0aa7b rollback to 1.7.12
ba856bc add ping
970af4a Better UX
be60c96 Fix stack’s name
d4643fd update to traefik 1.7.14
7af3a62 removed / its part of traefik_stack5
25306fb remove ToDo as it is managed in github issues
d78dcea cleaner script
b21424e Init / env-template

## 2.3.0
### ⚡️ Updates
- 6c559e20 update to traefik:1.7.13
- various scripts updates

# Releases

## 4.1.0 (2021-06-11)
### ⚡️ Updates
- [8383f52](https://github.com/pascalandy/docker-stack-this/commit/8383f52) update to traefik:1.7.30-alpine

### 🔍 Compare
- ... with previous release: [4.1.0 <> 4.1.0](https://github.com/pascalandy/docker-stack-this/compare/4.1.0...4.1.0)

## 4.1.0 (2021-04-04)
### ⚡️ Updates
- [065c03e](https://github.com/pascalandy/docker-stack-this/commit/065c03e) Update docker-stack-this to version 4.1.0 /Dockerfile
- [f7cd8ae](https://github.com/pascalandy/docker-stack-this/commit/f7cd8ae) update to traefik:1.7.28
- [e824b35](https://github.com/pascalandy/docker-stack-this/commit/e824b35) Add FLAG ‘NODE 1’
- [c9a806b](https://github.com/pascalandy/docker-stack-this/commit/c9a806b) update README
- [cfc7294](https://github.com/pascalandy/docker-stack-this/commit/cfc7294) basic-auth fix
- [eaf9353](https://github.com/pascalandy/docker-stack-this/commit/eaf9353) basic-auth VAR does not work
- [825a51e](https://github.com/pascalandy/docker-stack-this/commit/825a51e) use a VAR basic-auth
- [5962ad1](https://github.com/pascalandy/docker-stack-this/commit/5962ad1) Improve docs about basic-auth
- [54b044e](https://github.com/pascalandy/docker-stack-this/commit/54b044e) basic auth new password
- [dfafeaa](https://github.com/pascalandy/docker-stack-this/commit/dfafeaa) Add auth.basic
- [591356f](https://github.com/pascalandy/docker-stack-this/commit/591356f) remove stgfirexyz
- [51f1421](https://github.com/pascalandy/docker-stack-this/commit/51f1421) add comments
- [2c6129c](https://github.com/pascalandy/docker-stack-this/commit/2c6129c) define sensitive vars
- [9b72b9a](https://github.com/pascalandy/docker-stack-this/commit/9b72b9a) rollback to acme.httpchallenge
- [4bf68e6](https://github.com/pascalandy/docker-stack-this/commit/4bf68e6) add --acme.onhostrule=true
- [5603b8f](https://github.com/pascalandy/docker-stack-this/commit/5603b8f) stgfirexyz wip
- [6ba5a2b](https://github.com/pascalandy/docker-stack-this/commit/6ba5a2b) Init stgfirexyz as nginx
- [bb6c51e](https://github.com/pascalandy/docker-stack-this/commit/bb6c51e) add stgfirefirepresslink /b
- [8fbe8b3](https://github.com/pascalandy/docker-stack-this/commit/8fbe8b3) add stgfirefirepresslink
- [902c7b9](https://github.com/pascalandy/docker-stack-this/commit/902c7b9) DO_TOKEN via var, not a secret
- [02d074b](https://github.com/pascalandy/docker-stack-this/commit/02d074b) add traefikdev /c
- [8fa6bfc](https://github.com/pascalandy/docker-stack-this/commit/8fa6bfc) empty
- [021efed](https://github.com/pascalandy/docker-stack-this/commit/021efed) dnsChallenge with DO /b
- [7247191](https://github.com/pascalandy/docker-stack-this/commit/7247191) Add secret for DO token
- [7a95d2e](https://github.com/pascalandy/docker-stack-this/commit/7a95d2e) dnsChallenge with DO /a

### 🔍 Compare
- ... with previous release: [4.0.0 <> 4.1.0](https://github.com/pascalandy/docker-stack-this/compare/4.0.0...4.1.0)

## 4.0.0 (2020-11-18)
### ⚡️ Updates
- [144ad01](https://github.com/pascalandy/docker-stack-this/commit/144ad01) Major: Traefik manage certs via ACME

### 🔍 Compare
- ... with previous release: [3.1.2 <> 4.0.0](https://github.com/pascalandy/docker-stack-this/compare/3.1.2...4.0.0)

## 3.1.2 (2020-04-27)
### ⚡️ Updates
- [e415fbe](https://github.com/pascalandy/docker-stack-this/commit/e415fbe) Fix changelog

### 🔍 Compare
- ... with previous release: [ <> 3.1.2](https://github.com/pascalandy/docker-stack-this/compare/...3.1.2)

## 3.1.1 (2020-04-27)
### ⚡️ Updates
- [4f4ba93](https://github.com/pascalandy/docker-stack-this/commit/4f4ba93) FIX Changelog
- [453ffb8](https://github.com/pascalandy/docker-stack-this/commit/453ffb8) Update changelog
- [b3f4aed](https://github.com/pascalandy/docker-stack-this/commit/b3f4aed) 3.1.1

### 🔍 Compare
- ... with previous release: [ <> 3.1.1](https://github.com/pascalandy/docker-stack-this/compare/...3.1.1)

## 3.1.0 (2020-04-27)
### ⚡️ Updates
- [b3f4aed](https://github.com/pascalandy/docker-stack-this/commit/b3f4aed) 3.1.1

### 🔍 Compare
- ... with previous release: [ <> 3.1.0](https://github.com/pascalandy/docker-stack-this/compare/...3.1.0)

## 3.1.0 (2020-04-27)
### ⚡️ Updates
- [02eb5f0](https://github.com/pascalandy/docker-stack-this/commit/02eb5f0) 3.1.0
- [c338fbe](https://github.com/pascalandy/docker-stack-this/commit/c338fbe) Merge branch 'edge'
- [a6d7cea](https://github.com/pascalandy/docker-stack-this/commit/a6d7cea) README wip
- [608dbfd](https://github.com/pascalandy/docker-stack-this/commit/608dbfd) Merge branch 'master' into edge

### 🔍 Compare
- ... with previous release: [ <> 3.1.0](https://github.com/pascalandy/docker-stack-this/compare/...3.1.0)

## 1.7.20
### ⚡️ Updates
a171eac Updated to version: 1.7.20
55e47c4 update traefik:1.7.20
1a12f35 copy updates
36cba80 reset traefik_stack6 directory
b3d7e3c Merge branch 'master' into edge

## 1.7.19
### ⚡️ Updates
ee52e50 Add dockerignore
e71e452 update to 1.7.19
703087c update to 1.7.18
d1bdd91 update to 1.7.17
31dc46a update to 1.7.16
2100493 update to 1.7.15
d813a66 update to 1.7.14
7f545f8 rollback from 1.7.13
b2775e3 Testing 1.7.19 /d
c3d4979 Testing 1.7.19 /c
334ed02 Testing 1.7.19 /b
09f154b using branch edge instead of dev when developping
37d1783 better template for gitognore
74fedae update to traefik:1.7.19
c976e59 simple linting
dc0aa7b rollback to 1.7.12
ba856bc add ping
970af4a Better UX
be60c96 Fix stack’s name
d4643fd update to traefik 1.7.14
7af3a62 removed / its part of traefik_stack5
25306fb remove ToDo as it is managed in github issues
d78dcea cleaner script
b21424e Init / env-template
## 2.2.3
### 🐛 Fix bug
- 2a253c82 moved proxysocket at the root of the projet

## 2.2.2
### 🐛 Fix bug
- 99d105bc FIX push_release script

## 2.2.1
### ⚡️ Updates
- 5effe45b Merge branch 'dev'
- 58038798 cleaner release
- c2750e83 update changelog
### 🐛 Fix bug
- badd1f18 FIX script since I upgraded my hard drive

## 2.2.0
### 🚀 Added (new feat.)
- ea604e32 Replace Socat with ProxySocket based on haproxy

## 2.1.0
### ⚡️ Updates
- 14814568 Update to caddy 1.0.1
- c717d97f Better UX when script is running
- b9ec040e update to Traefik:1.7.12

## 2.03
### ⚡️ Updates
- 0aee933a readme update
- 02df3144 update to socatproxy:1.2
- d7499f92 roll back
- b9261af6 remove stack6 wip

## 2.02
### ⚡️ Updates
- 16c1dca0 Update to Traefik 1.7.9
- 60c8469d update path

## 2.01
### ⚡️ Updates
- 639050dd Update to Traefik 1.7.9
- Added a script to push release easily
- Better gitignore
- comment about a compose file beeing tested

## 2.00
### ⚡️ Updates
- bump to traefik 1.7.8

p.s. I bump to a major version because in my overall DevOps set up it makes sense. But there is nothing major regarding this particular repo.

## 1.56
### ⚡️ Updates
- bump to traefik 1.7.7
- better log management on all services
- better README
- better comments within compose files

## 1.55
### 🚀 Added (new feat.)
- traefik is now using Authentification

## 1.54
### ⚡️ Updates
- d2b3a5fa readme udpate
- bump to caddy 0.11.1
- bump to traefik 1.7.6
- remove static files for webapps

## 1.53
### 🚀 Added (new feat.)
- Added portainer with its agent

## 1.52
### ⚡️ Updates
- fixed minimum memory requirement from 1M to 4M

## 1.51
### ⚡️ Updates
- update memory defaults

## 1.50
### 🚀 Added (new feat.)
- added bash-template (best practices)
- cleaning the project

## 1.49
### ⚡️ Updates
- update to traefik 1.7.5
- rebuild socatproxy from alpine:3.8
- Add a ntw_proxy network
- various code cleaning
- removed DIR traefik_stack6-wip

## 1.48
### 🐛 Fix bug
- Fix trailing ‘/‘ issue for portainer

## 1.47
### ⚡️ Updates
- bump to traefik 1.6.6

## 1.47
### ⚡️ Updates
- bump to traefik 1.6.5

## 1.45
### ⚡️ Updates
- 60dc878c bump to traefik 1.6.4

## 1.44
### ⚡️ Updates
- we still use portainer 1.16.5
	- 2541361e portainer 1.17.1 is not stable
- 58e236ed portainer major refactoring /C
- could not run caddy 0.11.0
	- 3f7608a1 rollback caddy:0.10.14
- 2c5bd542 bump to portainer:1.17.1
- 19a757d0 bump to traefik:1.6.2-alpine

## 1.43
### ⚡️ Updates
could not work under branch 1.43 weird …

## 1.42
### ⚡️ Updates
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
### ⚡️ Updates
- caddy 0.10.12
- Testing wordpress via traefik_stack6-wip
- update to portainer 1.16.5

## bump to 1.40
### ⚡️ Updates
- update to nginx 1.13.10-alpine
- update to caddy 0.10.11

## bump to 1.38
### ⚡️ Updates
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

