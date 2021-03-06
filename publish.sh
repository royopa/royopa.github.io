#!/bin/bash

# configure env
git config --global user.email 'royopa@gmail.com'
git config --global user.name 'Rodrigo Prado de Jesus'

if [ $# -ne 1 ]; then
    echo "usage: ./publish.sh \"commit message\""
    exit 1;
fi

sculpin generate --env=prod

git stash
git checkout master

cp -R output_prod/* .
rm -rf output_*

git add *
git commit -m "$1"
git push origin --all

git checkout drafts
git stash pop
