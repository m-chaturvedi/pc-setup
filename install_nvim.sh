#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR="${BASH_SOURCE%/*}"
source $DIR/install_header.sh


if [ ! -d $HOME/workspace/nvim ]; then
    git_clone git@github.com:m-chaturvedi/nvim_config.git $HOME/.config/nvim
    git checkout $NVIM_CONFIG_BRANCH

    # Install vim Plug
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    nvim -c 'PlugInstall' -c 'qall'
else
    echo "WAR: $HOME/workspace/nvim already exists!"
fi
