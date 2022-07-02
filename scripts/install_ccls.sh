#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR="${BASH_SOURCE%/*}"
source $DIR/install_header.sh
if [ ! -d /home/chaturvedi/workspace/ccls ]; then
    git clone --depth=1 --recursive https://github.com/MaskRay/ccls
    pushd ccls

    /bin/bash $DIR/install_llvm.sh
    mkdir build
    cd build
    install_with_cmake_and_stow ccls "-DCMAKE_BUILD_TYPE=Release\
        -DCMAKE_PREFIX_PATH=/usr/local"
else
    echo "WAR: /home/chaturvedi/workspace/tmux already exists!"
fi
