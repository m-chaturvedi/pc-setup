#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR="${BASH_SOURCE%/*}"
source $DIR/install_header.sh

if [ ! -d $HOME/workspace/fzf ]; then
    cd $HOME/workspace
    git_clone git@github.com:junegunn/fzf.git fzf
    pushd fzf
    ./install --no-update-rc
    sudo mkdir -p /usr/local/stow/fzf
    sudo cp -r bin /usr/local/stow/fzf
    stow_package fzf
else
    echo "WAR: $HOME/workspace/fzf already exists!"
fi



