#!/bin/bash

THIS_DIR="$(cd $(dirname ${BASH_SOURCE}); pwd)"
NEW_PATH="${PATH}:${THIS_DIR}/../node_modules/forever/bin"

main() {
    screen -wipe
    sleep 1.5
    screen -ls | grep \.mongod >/dev/null || return 1
    screen -ls | grep \.brunch >/dev/null || return 1
    env PATH="${NEW_PATH}" forever list | grep server/app.js >/dev/null \
        || return 1
    env PATH="${NEW_PATH}" forever list | grep server/app.js \
        | grep -v STOPPED >/dev/null || return 1
    env PATH="${NEW_PATH}" forever list | grep twitter_proxy/app.js >/dev/null \
        || return 1
    env PATH="${NEW_PATH}" forever list | grep twitter_proxy/app.js \
        | grep -v STOPPED >/dev/null || return 1
    return 0
}
main
