#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 cmd [args ...]"
    exit 1
fi

command=$1
shift
args=( "$@" )

temp_file=$(mktemp)
function clean_exit { rm -f "$temp_file"; exit 0; }

trap clean_exit INT
$command "${args[@]}" > "$temp_file" < /dev/null

return_code=$?
printf "Command finished with code: %d\n" "$return_code"

if [[ -s $temp_file ]]; then
    while true; do
        echo -n "Display output in: (e/p/o/n/?) "
        read -r option

        case $option in
            e)
                ${EDITOR:-nano} "$temp_file"
                break ;;

            p)
                ${PAGER:-less} "$temp_file"
                break ;;

            o)
                cat "$temp_file"
                break ;;

            n)
                break ;;

            *)
                echo "e - open in editor"
                echo "p - open in pager"
                echo "o - print to stdout"
                echo "n - do nothing"
                ;;
        esac
    done
fi

clean_exit
