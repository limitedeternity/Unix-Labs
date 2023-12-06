#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
    sed 's/[[:blank:]]*$//'
else
    for file in "$@"
    do
        sed -i 's/[[:blank:]]*$//' "$file"
    done
fi
