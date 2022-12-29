#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR="${PWD}"
source $DIR/install_header.sh

if [ ! -d $HOME/workspace/vifm ]; then
    cd $HOME/workspace
    git clone git@github.com:vifm/vifm.git
    pushd vifm
    autoreconf -f -i
    # Hack to install it.
    touch data/vifm-help.txt
    install_with_configure_and_stow vifm
else
    echo "WAR: $HOME/workspace/vifm already exists!"
fi
