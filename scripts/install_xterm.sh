#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR="${BASH_SOURCE%/*}"
source $DIR/install_header.sh
pushd /home/chaturvedi/workspace

if [ ! -d /home/chaturvedi/workspace/xterm-snapshots ]; then
    git_clone git@github.com:ThomasDickey/xterm-snapshots.git xterm-snapshots
    pushd xterm-snapshots
    install_with_configure_and_stow xterm
else
    echo "WAR: /home/chaturvedi/workspace/xterm-snapshots already exists!"
fi
