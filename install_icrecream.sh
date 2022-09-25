#!/usr/bin/env bash
set -euo pipefail

source install_header.sh

cd $HOME/workspace
git_clone git@github.com:renatoGarcia/icecream-cpp.git $HOME/workspace/icecream-cpp

cd $HOME/workspace/icecream-cpp

