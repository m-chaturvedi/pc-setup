#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR="${BASH_SOURCE%/*}"
source $DIR/install_header.sh
if [ ! -d /home/chaturvedi/workspace/tmux ]; then
    git_clone git@github.com:tmux/tmux.git tmux
    pushd tmux
    git checkout 3.1
    sh autogen.sh
    install_with_configure_and_stow tmux
else
    echo "WAR: /home/chaturvedi/workspace/tmux already exists!"
fi



