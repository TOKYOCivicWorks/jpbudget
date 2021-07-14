#!/bin/bash

THIS_DIR="$(cd $(dirname ${BASH_SOURCE}); pwd)"
NEW_PATH="${PATH}:${THIS_DIR}/../node_modules/forever/bin"

main() {
    env PATH="${NEW_PATH}" forever stop server/app.js >/dev/null 2>/dev/null
    env PATH="${NEW_PATH}" forever stop twitter_proxy/app.js >/dev/null 2>/dev/null
    pkill -KILL node
    pkill -KILL forever
    pkill -KILL mongod
    pkill -KILL screen
    screen -wipe >/dev/null 2>/dev/null
    return 0
}
main
