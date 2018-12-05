#!/usr/bin/env bash

# A best practices Bash script template with many useful functions. This file
# sources in the bulk of the functions from the source.sh file which it expects
# to be in the same directory. Only those functions which are likely to need
# modification are present in this file. This is a great combination if you're
# writing several scripts! By pulling in the common functions you'll minimise
# code duplication, as well as ease any potential updates to shared functions.

# A better class of script
set -o errexit          # Exit on most errors (see the manual)
set -o errtrace         # Make sure any error trap is inherited
set -o nounset          # Disallow expansion of unset variables
set -o pipefail         # Use last non-zero exit code in a pipeline
#set -o xtrace          # Trace the execution of the script (debug)

# DESC: Usage help
# ARGS: None
# OUTS: None
function script_usage() {
    cat << EOF
Usage:
     -h|--help                  Displays this help
     -v|--verbose               Displays verbose output
    -nc|--no-colour             Disables colour output
    -cr|--cron                  Run silently unless we encounter an error
EOF
}

# DESC: Parameter parser
# ARGS: $@ (optional): Arguments provided to the script
# OUTS: Variables indicating command-line parameters and options
function parse_params() {
    local param
    while [[ $# -gt 0 ]]; do
        param="$1"
        shift
        case $param in
            -h|--help)
                script_usage
                exit 0
                ;;
            -v|--verbose)
                verbose=true
                ;;
            -nc|--no-colour)
                no_colour=true
                ;;
            -cr|--cron)
                cron=true
                ;;
            *)
        esac
    done
}


# DESC: Main control flow
# ARGS: $@ (optional): Arguments provided to the script
# OUTS: None
function main() {
    # load config and variables for this project
    source "$(dirname "${BASH_SOURCE[0]}")/config_and_vars.sh"
    source "$(dirname "${BASH_SOURCE[0]}")/shellcheck.sh"

    trap script_trap_err ERR
    trap script_trap_exit EXIT

    script_init "$@"
    parse_params "$@"
    cron_init
    colour_init
    #lock_init system

    clear; echo;
    goto_myscript;
    echo;
}

# --- edit YOUR SCRIPT HERE
function goto_myscript() {

# play-with-docker is ready
docker run --rm devmtl/figlet:1.0 lauching stacks; sleep 2; echo;

# Stop
echo; echo "If existing, remove stacks: "
./rundown.sh

# Create Network
echo; echo "If not existing, create our network: "

NTW_FRONT="ntw_front"

if [ ! "$(docker network ls --filter name=${NTW_FRONT} -q)" ]; then
    docker network create --driver overlay --attachable --opt encrypted "${NTW_FRONT}"
    echo "Network: ${NTW_FRONT} was created."
else
    echo "Network: ${NTW_FRONT} already exist."
fi

NTW_PROXY="ntw_proxy"

if [ ! "$(docker network ls --filter name=${NTW_PROXY} -q)" ]; then
    docker network create --driver overlay --attachable --opt encrypted "${NTW_PROXY}"
    echo "Network: ${NTW_PROXY} was created."
else
    echo "Network: ${NTW_PROXY} already exist."
fi

echo; echo "Show network..."
docker network ls | grep "ntw_"
echo; echo; sleep 2

# The Stack
echo "Start the stacks ..."; echo; echo;

# traefik
docker stack deploy toolproxy -c toolproxy.yml
echo; sleep 1;

# webapps
docker stack deploy toolwebapp -c toolwebapp.yml
echo; sleep 1;

    # testing as there is now an official stack
    # https://portainer.readthedocs.io/en/stable/deployment.html#inside-a-swarm-cluster
docker stack deploy toolgui -c toolportainer.yml
echo; sleep 1;

# wordpress
    # the system is path is at ./docker-stack5
#_MYSQL_DIR="$(pwd)/html/db/mysql"
#mkdir -p "$_MYSQL_DIR"

#docker stack deploy toolwp -c toolwp.yml
echo; sleep 1;

# List
echo; echo "docker stack ls ..."
docker stack ls;
echo; echo ; sleep 2


# Follow deployment in real time
#watch docker service ls
echo; echo;

MIN="1"
MAX="8"
for ACTION in $(seq ${MIN} ${MAX}); do
  echo
  echo "docker service ls | Check ${ACTION}" of ${MAX}; echo;
  docker service ls && echo && sleep 2;
done
echo; echo ; sleep 2

# See Traefik logs
echo "To see Traefik logs type: "; sleep 1;
echo "  docker service logs -f toolproxy_traefik"; echo; sleep 1;

# play-with-docker is ready
docker run --rm devmtl/figlet:1.0 Your turn; echo;

}

# --- Entrypoint
main "$@"

# by Pascal Andy | https://pascalandy.com/
# https://github.com/pascalandy/bash-script-template
