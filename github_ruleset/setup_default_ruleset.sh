#!/bin/bash

if [ ! -d "./.temp" ]; then
    mkdir "./.temp"
fi

if [ ! -f "/usr/bin/jq.exe" ]; then
    curl -L -s -o /usr/bin/jq.exe https://github.com/stedolan/jq/releases/latest/download/jq-win64.exe
fi

source util.sh

load_env
load_scm
load_credential

repos=($(get_user_repos))

echo -e 'Your available repos:\n'
for repo in ${repos[@]}; do
    echo -e '\t' $repo
done
echo ''
read -p "Which repo do you choose? " repo
export REPO=$repo

create_develop_branch_protection_rules
create_main_branch_protection_rules
