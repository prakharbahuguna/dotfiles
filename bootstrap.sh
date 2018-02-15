#!/bin/bash

cd "$(dirname "${0}")" || exit 1

git pull origin master

doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
        --exclude "README.md" --exclude "LICENSE-MIT.txt" -avh --no-perms . ~
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

if [ "${1}" = "--force" ] || [ "${1}" = "-f" ]; then
    doIt
else
    read -r -p 'This may overwrite existing files in your home directory. Are you sure? (y/n) ' -n 1
    echo ''
    if [ "${REPLY}" = 'y' ]; then
        doIt
    fi
fi
