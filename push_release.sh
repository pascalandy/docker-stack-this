# This is specific to my local set up
source .env .

# vars
# GITHUB_TOKEN="3122133122133211233211233211233211322313123"
user="pascalandy"
git_repo="docker-stack-this"
local_repo="/Volumes/960G/_pascalandy/11_FirePress/Github/github_pascalandy/docker-stack-this"

# The tag must be ready to push on git remote
#
cd ${local_repo} && \
git push --tags && \

# Find the latest tag
#
tag_version="$(
	git ls-remote --tags ${git_repo} \
		| cut -d$'\t' -f2 \
		| cut -d/ -f3 \
		| tail -n1)" && \
echo ${tag_version} && \

# Push release on GitHub like a boss
# Requires: https://github.com/aktau/github-release
#
$GOPATH/bin/github-release release \
  --user ${user} \
  --repo ${git_repo} \
  --tag ${tag_version} \
  --name ${tag_version} \
  --description "Refer to [CHANGELOG.md](https://github.com/pascalandy/docker-stack-this/blob/master/CHANGELOG.md) for details about this release."



$GOPATH/bin/github-release info \
  --user ${user} \
  --repo ${git_repo} \
  --tag ${tag_version}