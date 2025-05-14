#!/bin/bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
    echo "Run with superuser privilages, please."
    exit 1
fi

TIMESTAMP="$(date +'%Y-%m-%dT%T%z')"

iptables-save > old_iptable_$TIMESTAMP.txt

