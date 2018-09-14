#!/bin/bash

# First, install Homebrew if it's not already installed
command -v brew > /dev/null || ruby -e \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --cleanup
brew cask upgrade

# Package lists
pkg_list=(axel ccache checkbashisms clang-format ctags fzf git-lfs git-review \
    iperf3 neovim pixz pv python rename reattach-to-user-namespace ripgrep \
    shellcheck speedtest-cli tmux tree uncrustify)
cask_list=(font-fira-code)

# Install the packages
brew install "${pkg_list[@]}"
brew cask install "${cask_list[@]}"

# Remove outdated versions from the cellar.
brew cleanup -s
brew cask cleanup

# Post-install stuff
git lfs install
/usr/local/opt/fzf/install
pip3 install -U pip setuptools wheel
pip3 install neovim
