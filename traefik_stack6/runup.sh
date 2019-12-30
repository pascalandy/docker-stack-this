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
    message_is="docker"
    docker run --rm devmtl/figlet:1.0 ${message_is} && \
    message_is="stack-this"
    docker run --rm devmtl/figlet:1.0 ${message_is} && sleep 2 && echo && \

    # If existing, remove stacks: "
    ./rundown.sh && \

    # If not existing, create networks"
    # create an overlay networks on docker swarm
    arr=( "ntw_front" "ntw_proxy" )

    for i in "${arr[@]}"; do
      if [ ! "$(docker network ls --filter name=${i} -q)" ]; then
      docker network create --driver overlay --attachable --opt encrypted "${i}"
      echo "Network: ${i} was created."
      else
          echo "Network: ${i} already exist."
      fi
    done

    message_is="Show networks" && docker run --rm devmtl/figlet:1.0 ${message_is} && echo && \
    docker network ls | grep "ntw_" && echo && sleep 2 && \
    clear;

    message_is="Launch stacks" && docker run --rm devmtl/figlet:1.0 ${message_is} && echo && \

    # Set ACME file
    #mkdir -pv           ~/./configs                   && \
    #touch               ~/./configs/acme.json         && \
    #cp dynamic_conf.yml ~/./configs/dynamic_conf.yml  && \
    #cp traefik.yml      ~/./configs/traefik.yml       && \
    #chmod 600 ~/./configs/acme.json         && \
    #chmod 600 ~/./configs/dynamic_conf.yml  && \
    #chmod 600 ~/./configs/traefik.yml       && \

    # deploy apps
    docker stack deploy stkproxy -c stk_traefik.yml && \
    docker stack deploy stkwebapp -c stk_web.yml && \
    docker stack deploy stkgui -c stk_portainer.yml && echo && \

    # deploy swarmpit / constraint the db
    #export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')
    #docker node update --label-add swarmpit.db-data=true $NODE_ID && echo;
    #docker stack deploy toolswarmpit -c stack-swarmpit.yml && echo; sleep 1;

    # deploy wordpress
        # the system is path is at ./docker-stack5
    #_MYSQL_DIR="$(pwd)/html/db/mysql"
    #mkdir -p "$_MYSQL_DIR"

    #docker stack deploy toolwp -c toolwp.yml
    #echo; sleep 1;

    FLAG_WAIT="true"
    while [[ ${FLAG_WAIT} == "true" ]]; do

      # check if apps are running on K8s (or are in progress)
      IN_PROGRESS=$(docker service ls | awk '{print $4}' | grep "0/" | wc -l)

      if [[ ${IN_PROGRESS} -ne 0 ]]; then
        docker service ls ;
        echo "===> Deployment in progress..." && echo && \
        sleep 2 ;
      elif [[ ${IN_PROGRESS} -eq 0 ]]; then
        echo "App deployed!" && echo && \
        FLAG_WAIT="false" && sleep 2 && \
        docker service ls ;
      else
        echo "Unexpected error (err45)" ;
      fi
    done && \
    echo && \


    message_is="Check services" && docker run --rm devmtl/figlet:1.0 ${message_is} && echo && \
    docker service ls && echo && \

    message_is="Your turn" &&docker run --rm devmtl/figlet:1.0 ${message_is} && echo && \

    # See Traefik logs
    echo "If you enjoy this project, Give it a Star or Fork it :)";
    echo "  https://github.com/pascalandy/docker-stack-this/" && echo && \

    # See Traefik logs
    echo "Command ideas: " && \
    echo "  docker service logs -f stkproxy_traefik" && \
    echo "  docker service ls" && \
    echo "  docker ps" && \
    echo "  docker stack ls" && echo;
}

# --- Entrypoint
main "$@"

# by Pascal Andy | https://pascalandy.com/
# https://github.com/pascalandy/bash-script-template
