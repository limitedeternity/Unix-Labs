#!/usr/bin/env bash

find . -type f -exec wc -l {} + | awk '{sum += $1} END {if (sum == 0) print 0; else print sum}'
