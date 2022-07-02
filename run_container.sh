#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

docker run  --rm -v $PWD/scripts:/scripts -it \
    -v /home/chaturvedi/.ssh:/home/chaturvedi/.ssh \
    --name "initial_setup_container" \
    -e TERM=tmux-256color \
    initial_setup_1:latest /bin/bash -c 'passwd --delete chaturvedi; su chaturvedi'
