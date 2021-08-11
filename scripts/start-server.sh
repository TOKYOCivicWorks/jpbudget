#!/bin/bash

THIS_DIR="$(cd $(dirname ${BASH_SOURCE}); pwd)"


check_process() {
    NEW_PATH="${PATH}:${THIS_DIR}/../node_modules/forever/bin"

    env PATH="${NEW_PATH}" forever list | grep server/app.js >/dev/null \
        || return 1
    env PATH="${NEW_PATH}" forever list | grep server/app.js \
        | grep -v STOPPED >/dev/null || return 1

    return 0
}

usage() {
    echo "Usage: $(basename $0) [OPTION]"
    echo "OPTION:"
    echo "  -h : Print help."
    echo "  -l : For local development (Use twitter proxy host at localhost)."
    echo "  -p : Use production environment (Set NODE_ENV as production)."
    echo "  -s : Use staging environment (Set NODE_ENV as staging)."
}

main() {
    cd "${THIS_DIR}/.."
    if [[ -e "${THIS_DIR}/.setuprc" ]]; then
        . "${THIS_DIR}/.setuprc"
    fi

    prefix=""
    while getopts hlps OPT; do
        case ${OPT} in
            h) usage
               return 0
               ;;
            # Use externally accessible IP for access from devices in the same network.
            l) DEFAULT_IF="$(netstat -nr | grep '^0.0.0.0' | awk '{print $8}')"
               IP="$(ifconfig | grep -A1 ^${DEFAULT_IF} | tail -1 | awk '{print $2}')"

               if [[ "${prefix}" = "" ]]; then
                   prefix="env"
               fi
               prefix="${prefix} TWITTER_PROXY_HOST=${IP} WEB_HOST=${IP}"
               echo "[INFO] Set TWITTER_PROXY_HOST=${IP} WEB_HOST=${IP}"
               ;;
            p) if [[ "${prefix}" = "" ]]; then
                   prefix="env"
               fi
               prefix="${prefix} NODE_ENV=production"
               ;;
            s) if [[ "${prefix}" = "" ]]; then
                   prefix="env"
               fi
               prefix="${prefix} NODE_ENV=staging"
               ;;
        esac
    done

    echo "[INFO] Save forever log /tmp/forever_server.log"
    ${prefix} make run
    sleep 5
    check_process
}
main "$@"
