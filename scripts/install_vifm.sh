#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR="${BASH_SOURCE%/*}"
source $DIR/install_header.sh

if [ ! -d /home/chaturvedi/workspace/vifm ]; then
    cd /home/chaturvedi/workspace
    git clone git@github.com:vifm/vifm.git
    pushd vifm
    autoreconf -f -i
    # Hack to install it.
    touch data/vifm-help.txt
    install_with_configure_and_stow vifm
else
    echo "WAR: /home/chaturvedi/workspace/vifm already exists!"
fi
