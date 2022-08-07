#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

mkdir -p $HOME/workspace/oh_my_zsh
pushd $HOME/workspace/oh_my_zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    /bin/bash install.sh --unattended --keep-zshrc
    git clone \
        --depth=1 \
        https://github.com/romkatv/powerlevel10k.git \
        $HOME/.oh-my-zsh/themes/powerlevel10k
else
    echo "WAR: Oh my zsh already exists!"
fi
