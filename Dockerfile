# The Dockerfile is not a real Dockerfile. 
# Those vars are used broadly outside this Dockerfile
# Github Action CI and release script (./utility.sh) is consuming these variables.
ARG VERSION="3.0.0"
ARG APP_NAME="docker-stack-this"
ARG GIT_PROJECT_NAME="docker-stack-this"
