#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 filename"
    exit 1
fi

if ! [[ -f "$1" ]]; then
    echo "The file $1 does not exist"
    exit 1
fi

# python3 test_progress.py
# ./progress.sh ../test/build.log
tail -n0 -f "$1" | grep -oP '\[\d+/\d+\]' --line-buffered | awk '{ print $0 "\033[1A"; }'
