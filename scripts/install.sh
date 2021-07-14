#!/bin/bash

SYSCTL_ADD="fs.inotify.max_user_watches=524288"
THIS_DIR="$(cd $(dirname ${BASH_SOURCE}); pwd)"


main() {
    sudo apt-get install ruby ruby-dev mongodb-server-core nodejs npm screen libcap2-bin || exit
    sudo gem install sass || exit
    sudo npm cache clean -f || exit
    sudo npm install -g n || exit
    sudo n latest || exit

    sudo setcap cap_net_bind_service=+ep $(which node)
    if ! grep "^${SYSCTL_ADD}$" /etc/sysctl.conf >/dev/null; then
        echo "${SYSCTL_ADD}" | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
    fi

    cd ${THIS_DIR}/..
    npm i
}
main
