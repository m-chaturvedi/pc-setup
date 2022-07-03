#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR="${BASH_SOURCE%/*}"
source $DIR/install_header.sh

if [ ! -d /home/chaturvedi/workspace/nvim ]; then
    /bin/bash $DIR/install_ccls.sh
    wget https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.tar.gz
    dtrx nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz
    sudo mv nvim-linux64 /usr/local/stow/nvim
    stow_package nvim

    git_clone git@github.com:m-chaturvedi/nvim_config.git /home/chaturvedi/.config/nvim
    git checkout $NVIM_CONFIG_BRANCH

    # Install vim Plug
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    nvim -c 'PlugInstall' -c 'qall'
else
    echo "WAR: /home/chaturvedi/workspace/nvim already exists!"
fi
