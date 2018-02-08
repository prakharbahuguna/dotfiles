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
    iperf3 mosh neovim pixz pv rename reattach-to-user-namespace ripgrep \
    shellcheck speedtest-cli tmux tree uncrustify)
cask_list=(anaconda font-hack)

# Install the packages
brew install ${pkg_list}
brew cask install ${cask_list}

# Remove outdated versions from the cellar.
brew cleanup -s
brew cask cleanup

# Post-install stuff
git lfs install
/usr/local/opt/fzf/install
/usr/local/anaconda3/bin/pip install neovim

# My anaconda don't want none unless you got updated packages, hun
/usr/local/anaconda3/bin/conda update --all
