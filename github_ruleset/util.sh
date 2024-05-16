#!/bin/bash

function is_integer {
    # arguments
    arr=$@
    input=$1

    re='^[0-9]+$'

    if [[ ! $input =~ $re ]]; then
        return 1
    fi

    return 0
}

function is_valid_scm_option {
    # arguments
    scm_option=$1
    shift
    valid_options=($@)

    if ! is_integer $scm_option; then
        return 1
    fi

    scm_option=$(expr $scm_option - 1)

    if [[ ! ${!valid_options[@]} =~ $scm_option ]]; then
        return 1
    fi

    return 0
}

function load_scm {

    scm_available_options=("github" "gitlab" "bitbucket")

    if [ ! -z $SCM ]; then
        source ${SCM}.sh
        return 0
    fi

    echo "Supported SCM:"
    for i in ${!scm_available_options[@]}; do
        echo -e '\t' "$(expr $i + 1). ${scm_available_options[$i]}"
    done

    echo ''
    read -p "Which SCM do you choose? " SCM

    # trim scm
    SCM=$SCM | xargs

    if ! is_valid_scm_option "$SCM" "${scm_available_options[@]}"; then
        echo "Only choose supported SCM by number"
        exit 1
    fi

    source ${scm_available_options[$(expr $SCM - 1)]}.sh
}

function load_env {
    if [ -f ".env" ]; then
        export $(grep -v '^#' .env | xargs)
    fi
}

function load_credential {
    if [[ -z $USERNAME || -z $TOKEN ]]; then
        read -p "username: " username
        read -s -p "token or password: " token

        export USERNAME=$username
        export TOKEN=$token
    fi
}