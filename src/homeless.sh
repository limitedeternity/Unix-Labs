#!/usr/bin/env bash

awk -F: '$6 == "/dev/null" {print $1 "\t" $3}' /etc/passwd | sort -k2n
printf "Total:\t"
awk -F: '$6 == "/dev/null" {count++} END {if (count == 0) print 0; else print count}' /etc/passwd
