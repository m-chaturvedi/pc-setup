#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR="${PWD}"
source $DIR/install_header.sh
pushd $HOME/workspace

if [ ! -d $HOME/workspace/xterm-snapshots ]; then
    git_clone git@github.com:ThomasDickey/xterm-snapshots.git xterm-snapshots
    pushd xterm-snapshots
    install_with_configure_and_stow xterm
else
    echo "WAR: $HOME/workspace/xterm-snapshots already exists!"
fi
