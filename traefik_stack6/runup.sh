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
  docker run --rm devmtl/figlet:1.0 Lauching stacks; sleep 2; echo;

# set vars
  #./config_and_vars.sh

# Stop
  echo; echo "If existing, remove stacks: "
  ./rundown.sh


# Create networks
  echo; echo "If not existing, create our network: "

  create_net="ntw_front"
      if [ ! "$(docker network ls --filter name=${create_net} -q)" ]; then
          docker network create --driver overlay --attachable --opt encrypted "${create_net}"
          echo "Network: ${create_net} was created."
      else
          echo "Network: ${create_net} already exist."
      fi

  create_net="ntw_proxy"
      if [ ! "$(docker network ls --filter name=${create_net} -q)" ]; then
          docker network create --driver overlay --attachable --opt encrypted "${create_net}"
          echo "Network: ${create_net} was created."
      else
          echo "Network: ${create_net} already exist."
      fi

  create_net="ntw_consul"
      if [ ! "$(docker network ls --filter name=${create_net} -q)" ]; then
          docker network create --driver overlay --attachable --opt encrypted "${create_net}"
          echo "Network: ${create_net} was created."
      else
          echo "Network: ${create_net} already exist."
      fi

  create_net="ntw_portainer"
      if [ ! "$(docker network ls --filter name=${create_net} -q)" ]; then
          docker network create --driver overlay --attachable --opt encrypted "${create_net}"
          echo "Network: ${create_net} was created."
      else
          echo "Network: ${create_net} already exist."
      fi


  echo; echo "Show network...";
  docker network ls | grep "ntw_";
  echo; echo; sleep 2;

  echo "Start the stacks ...";

# consul
  docker stack deploy toolconsul -c stack-consul.yml;
  echo; sleep 1;

# traefik
  docker stack deploy toolproxy -c stack-proxy.yml;
  echo; sleep 1;

# webapps
  docker stack deploy toolwebapp -c stack-webapp.yml;
  echo; sleep 1;

# gui
  docker stack deploy toolgui -c stack-portainer.yml;
  echo; sleep 1;

# wordpress
  # _MYSQL_DIR="$(pwd)/html/db/mysql"
  # mkdir -p "$_MYSQL_DIR"
  # docker stack deploy toolwp -c toolwp.yml
  # echo; sleep 1;

  # List
  echo; echo;
  docker service ls && echo && sleep 2;

  # Follow deployment in real time

  MIN="1"
  MAX="10"
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

# https://github.com/pascalandy/docker-stack-this
