#!/usr/bin/env bash
set -euo pipefail

function check_num_para () {
    local num_para=$1
    local exp_num_para=$2
    if [ $num_para -ne $exp_num_para ];
    then
        echo "ERROR: Expected $2 params, given $1."
        trap 'backtrace "${#BASH_SOURCE[@]}" "${BASH_SOURCE[@]}" "${#BASH_LINENO[@]}"' EXIT
    fi
}

function git_clone () {
    check_num_para $# 2
    if [ ! -d $2 ]; then
        git clone "$1" "$2"
    else
        echo "WAR: Directory "$PWD/$2" already exists."
    fi

}

function install_with_cmake () {
    check_num_para $# 1
    local cmake_options="$1"
    mkdir -p build
    cd build
    cmake "$cmake_options" ..
    make -j16
    sudo make install
}

function install_with_configure () {
    check_num_para $# 1
    local configure_options="$1"
    ./configure "$configure_options"
    make -j16
    sudo make install
}

function stow_package () {
    check_num_para $# 1
    local package_name="$1"
    sudo STOW_DIR=/usr/local/stow/ stow "$package_name"
}

function install_with_cmake_and_stow () {
    check_num_para $# 2
    local package_name="$1"
    local cmake_opts="$2"
    install_with_cmake \
        "$cmake_opts -DCMAKE_INSTALL_PREFIX=/usr/local/stow/$package_name"
    stow_package $package_name
}

function install_with_configure_and_stow () {
    check_num_para $# 1
    local package_name="$1"
    install_with_configure --prefix=/usr/local/stow/$package_name
    stow_package $package_name
}

