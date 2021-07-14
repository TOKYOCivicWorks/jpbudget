#!/bin/bash

THIS_DIR="$(cd $(dirname ${BASH_SOURCE}); pwd)"

fail() {
    echo "[ERROR] ${1} failed."
    exit
}

main() {
    echo "[INFO] Starting mongod..."
    "${THIS_DIR}"/start-mongod.sh "$@" || fail "Start mongod"
    sleep 1

    echo "[INFO] Starting brunch..."
    "${THIS_DIR}"/start-brunch.sh "$@" || fail "Start brunch"
    sleep 5

    echo "[INFO] Starting server..."
    "${THIS_DIR}"/start-server.sh "$@" || fail "Start server"

    echo "[INFO] Starting twitter proxy..."
    "${THIS_DIR}"/start-twitter-proxy.sh "$@" || fail "Start twitter proxy"
}
main "$@"
