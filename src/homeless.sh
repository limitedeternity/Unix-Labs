#!/usr/bin/env bash

awk -F: '$6 == "/dev/null" {print $1 "\t" $3}' /etc/passwd | sort -k2n

echo -n "Total: "
awk -F: '$6 == "/dev/null" {count++} END {print count}' /etc/passwd
