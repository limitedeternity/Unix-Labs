#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 filename"
    exit 1
fi

if ! [[ -f "$1" ]]; then
    echo "The file $1 does not exist"
    exit 1
fi

tail -f "$1" | grep -oP '\[\d+/\d+\]' | awk '{print "[" $0 "]"}'
