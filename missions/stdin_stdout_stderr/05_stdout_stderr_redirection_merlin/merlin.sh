#!/usr/bin/env bash

source gettext.sh


main() {
    if [ "${#@}" -ge 1 ]
    then
        local cmd_name=$(basename "$0")
        echo "$(eval_gettext 'Error: $cmd_name takes no argument.')" >&2
        return 1
    fi

    local msg=$(gettext "THESECRETKEYISONSTDERR")
    local key=$(cat "$GSH_VAR/secret_key")

    local i j I J
    I=${#msg}
    J=${#key}
    i=0
    j=0
    while [ "$i" -lt $I ] || [ "$j" -lt "$J" ]
    do
        if [ "$j" -ge "$J" ] || ( [ "$i" -lt "$I" ] && [ "$((RANDOM % (I+J)))" -lt "$I" ] )
        then
            printf "${msg:$i:1}"
            i=$((i+1))
        else
            printf "${key:$j:1}" >&2
            j=$((j+1))
        fi
    done
    echo
    echo >&2
}
main "$@"
