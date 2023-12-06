#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 filename"
    exit 1
fi

file_size=$(python3 -c "import random; print(random.randint(1, 4096))")
dd if=/dev/urandom of="$1" bs=1 count="$file_size" 2>/dev/null
