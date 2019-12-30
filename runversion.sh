#!/usr/bin/env bash
# This should be applied after updating the CHANGELOG.md 

# A better class of script
set -o errexit          # Exit on most errors (see the manual)
set -o errtrace         # Make sure any error trap is inherited
set -o nounset          # Disallow expansion of unset variables
set -o pipefail         # Use last non-zero exit code in a pipeline
#set -o xtrace          # Trace the execution of the script (debug)


##################################################
# run the script an pass an ARG like '2.3.0'
tag_version=$1

# tag and commit our latest commit
git tag ${tag_version} && \
git push --tags;

# load secrets
source .env .

user="pascalandy"
git_repo="docker-stack-this"
GOPATH=$(go env GOPATH)

# Requires https://github.com/aktau/github-release
$GOPATH/bin/github-release release \
  --user ${user} \
  --repo ${git_repo} \
  --tag ${tag_version} \
  --name ${tag_version} \
  --description "Refer to [CHANGELOG.md](https://github.com/pascalandy/docker-stack-this/blob/master/CHANGELOG.md) for details about this release."

# Find the latest tag
# We could add this logic: minor or major. Then the system will manage the SEMVERSION automatically
# tag_version="$(git tag --sort=-creatordate | head -n1)" && echo ${tag_version}
