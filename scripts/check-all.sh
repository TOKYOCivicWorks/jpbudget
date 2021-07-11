#!/bin/bash

main() {
    screen -wipe
    sleep 1.5
    screen -ls | grep \.mongod >/dev/null || return 1
    screen -ls | grep \.brunch >/dev/null || return 1
    screen -ls | grep \.server >/dev/null || return 1
    screen -ls | grep \.twitter-proxy >/dev/null || return 1
    return 0
}
main
