#!/usr/bin/env bash

if [[ $# -ne 0 ]]; then
    result=$(($*))
else
    read -r expr
    result=$($expr)
fi

echo "$result"
