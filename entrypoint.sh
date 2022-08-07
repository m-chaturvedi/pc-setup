#!/bin/bash
set -euox pipefail
export DEBIAN_FRONTEND=noninteractive

# Inside /script
source scripts/install_header.sh
sudo apt-get update
# Install packages from package-list
export GCC_VERSION=11
export TMUX_VERSION=3.1
export NVIM_VERSION=0.7.2
export NVIM_CONFIG_BRANCH=master

cat scripts/packages.txt | envsubst | xargs sudo apt-get --no-install-recommends -y install
cat scripts/pip-packages.txt | xargs pip3 install -U

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/chaturvedi/.local/bin


# Inside /home/chaturvedi/workspace
mkdir -p /home/chaturvedi/workspace
if [ ! -e /home/chaturvedi/.local/share/yadm/repo.git ]; then
    yadm clone git@github.com:m-chaturvedi/yadm.git
else
    echo "WAR: Directory "$PWD/yadm" already exists."
fi

curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash

#/bin/bash -x scripts/install_tmux.sh
#/bin/bash -x scripts/install_oh_my_zsh.sh
# /bin/bash /scripts/install_xterm.sh
#/bin/bash -x scripts/install_vifm.sh
#/bin/bash -x scripts/install_nvim.sh
/bin/bash -x scripts/install_fzf.sh

#install_deb https://github.com/sharkdp/fd/releases/download/v8.4.0/fd-musl_8.4.0_amd64.deb
#install_deb https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb


