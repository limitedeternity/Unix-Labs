#!/usr/bin/env bash

find . -type f -exec wc -l {} + | awk '{ sum += $1 } END { print sum }'
