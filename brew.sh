#!/bin/zsh

if [[ $OSTYPE != *darwin* ]]
then
    echo 'This script is only for MacOS'
    exit 1
fi

# First, install Homebrew if it's not already installed
command -v brew > /dev/null ||
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install the packages
brew bundle install --upgrade --cleanup

# Post-install stuff
pushd /opt/homebrew/bin
for i in {,e,f,z,ze,zf}grep
    do cp -s ugrep $i
done
popd
