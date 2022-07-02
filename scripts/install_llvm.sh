#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

DIR="${BASH_SOURCE%/*}"
source $DIR/install_header.sh
mkdir -p /home/chaturvedi/workspace/llvm-11
if [ ! -d /home/chaturvedi/workspace/llvm-11 ]; then
    pushd /home/chaturvedi/workspace/llvm-11
    PKG="clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04"
    wget https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/$PKG.tar.xz
    dtrx "$PKG.tar.xz"
    sudo mv "$PKG" /usr/local/stow/llvm
    stow_package llvm
    popd
else
    echo "WAR: /home/chaturvedi/workspace/llvm-11 already exists!"
fi
