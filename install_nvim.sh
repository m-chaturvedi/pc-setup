#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR="${PWD}"
source $DIR/install_header.sh


if [ ! -d $HOME/workspace/nvim ]; then
    git_clone git@github.com:m-chaturvedi/nvim_config.git $HOME/.config/nvim
    git checkout $NVIM_CONFIG_BRANCH

    wget https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim-linux64.tar.gz -O /$PWD/nvim-linux64.tar.gz
    tar -xzf nvim-linux64.tar.gz
    sudo mv nvim-linux64 /usr/local/stow/nvim
    stow_package nvim

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env
    cargo install tree-sitter-cli


    # Install vim Plug
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    nvim -c 'PlugInstall' -c 'qall'
else
    echo "WAR: $HOME/workspace/nvim already exists!"
fi
