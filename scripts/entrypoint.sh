#!/bin/bash
set -euox pipefail
export DEBIAN_FRONTEND=noninteractive

# Inside /script
pushd /scripts
source install_header.sh
sudo apt-get update
# Install packages from package-list
cat packages.txt | xargs sudo apt-get --no-install-recommends -y install
cat pip-packages.txt | xargs pip3 install -U

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/chaturvedi/.local/bin


# Inside /home/chaturvedi/workspace
mkdir -p /home/chaturvedi/workspace
pushd /home/chaturvedi/workspace
if [ ! -e /home/chaturvedi/.config/yadm/repo.git ]; then
    yadm clone git@github.com:m-chaturvedi/yadm.git
else
    echo "WAR: Directory "$PWD/yadm" already exists."
fi
/bin/bash /scripts/install_tmux.sh
/bin/bash /scripts/install_oh_my_zsh.sh
/bin/bash /scripts/install_xterm.sh
/bin/bash /scripts/install_vifm.sh
/bin/bash /scripts/install_nvim.sh
