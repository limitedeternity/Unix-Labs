#!/usr/bin/env bash

function mirror {
    if [[ "$#" -gt 0 ]]; then
        local arg=$1
        shift

        case $arg in
            H)
                rev | mirror "$@"
                ;;
            V)
                tac | mirror "$@"
                ;;
            *)
                mirror "$@"
                ;;
        esac
    else
        cat -
    fi
}

mirror "$@"
