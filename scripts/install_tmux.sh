#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR="${BASH_SOURCE%/*}"
source $DIR/install_header.sh
if [ ! -d $HOME/workspace/tmux ]; then
    cd $HOME/workspace
    git_clone git@github.com:tmux/tmux.git tmux
    pushd tmux
    git checkout $TMUX_VERSION
    sh autogen.sh
    install_with_configure_and_stow tmux
else
    echo "WAR: $HOME/workspace/tmux already exists!"
fi



