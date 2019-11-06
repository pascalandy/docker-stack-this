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

    docker pull devmtl/figlet:1.0
    
    clear;
    message_is="docker-stack-this"
    docker run --rm devmtl/figlet:1.0 ${message_is} && sleep 2 && echo;

    clear;
    message_is="If existing, remove stacks: "
    docker run --rm devmtl/figlet:1.0 ${message_is} && sleep 2 && echo;
    ./rundown.sh

    clear;
    message_is="If not existing, create networks"
    docker run --rm devmtl/figlet:1.0 ${message_is} && echo;

    this_net="ntw_front"
        if [ ! "$(docker network ls --filter name=${this_net} -q)" ]; then
            docker network create --driver overlay --attachable --opt encrypted "${this_net}"
            echo "Network: ${this_net} was created."
        else
            echo "Network: ${this_net} already exist."
        fi

    this_net="ntw_proxy"
        if [ ! "$(docker network ls --filter name=${this_net} -q)" ]; then
            docker network create --driver overlay --attachable --opt encrypted "${this_net}"
            echo "Network: ${this_net} was created."
        else
            echo "Network: ${this_net} already exist."
        fi
    echo;

    message_is="Show networks"
    docker run --rm devmtl/figlet:1.0 ${message_is} && echo;

    docker network ls | grep "ntw_" && echo && sleep 2;

    clear;
    message_is="Launch stacks"
    docker run --rm devmtl/figlet:1.0 ${message_is} && echo;


    # traefik
    chmod 600 ./configs/acme.json
    
    docker stack deploy stkproxy -c stack-proxy.yml && echo; sleep 1;

    # webapps
    docker stack deploy stkwebapp -c stack-webapp.yml && echo; sleep 1;

    # gui
    docker stack deploy stkgui -c stack-portainer.yml && echo; sleep 1;

    # swarmpit / constraint the db
    #export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')
    #docker node update --label-add swarmpit.db-data=true $NODE_ID && echo;
    #docker stack deploy toolswarmpit -c stack-swarmpit.yml && echo; sleep 1;

    # wordpress
        # the system is path is at ./docker-stack5
    #_MYSQL_DIR="$(pwd)/html/db/mysql"
    #mkdir -p "$_MYSQL_DIR"

    #docker stack deploy toolwp -c toolwp.yml
    #echo; sleep 1;

    clear;
    message_is="Check services"
    docker run --rm devmtl/figlet:1.0 ${message_is} && echo;

    MIN="1"
    MAX="8"
    for ACTION in $(seq ${MIN} ${MAX}); do
      echo && echo "docker service ls | Check ${ACTION}" of ${MAX}; echo;
      docker service ls && echo && sleep 2;
    done
    echo;

    docker stack ls && echo;

    message_is="Your turn"
    docker run --rm devmtl/figlet:1.0 ${message_is} && echo;

    # See Traefik logs
    echo "If you enjoy this project, Give it a Star or Fork it :)";
    echo "  https://github.com/pascalandy/docker-stack-this/" && echo;

    # See Traefik logs
    echo "Command ideas: ";
    echo "  docker service logs -f stkproxy_traefik";
    echo "  docker service ls";
    echo "  docker stack ls"; echo;
}

# --- Entrypoint
main "$@"

# by Pascal Andy | https://pascalandy.com/
# https://github.com/pascalandy/bash-script-template
