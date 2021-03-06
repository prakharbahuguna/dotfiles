#!/bin/bash

# First, install Homebrew if it's not already installed
command -v brew > /dev/null ||
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Package lists
pkg_list=(bitwarden-cli ccache checkbashisms clang-format ctags fzf git-lfs \
    iperf3 mas neovim python rename ripgrep shellcheck speedtest-cli tmux tree \
    uncrustify youtube-dl)
cask_list=(appcleaner coconutbattery docker firefox flycut font-fira-code \
    gfxcardstatus iterm2 macs-fan-control qbittorrent scroll-reverser spotify \
    visual-studio-code vlc
)
mas_list=(1116599239 585829637 1147396723 1449412482 1352778147 1295203466)

# Install the packages
brew install "${pkg_list[@]}"
brew tap homebrew/cask-fonts
brew install --cask "${cask_list[@]}"
mas install "${mas_list[@]}"

# Remove outdated versions from the cellar.
brew cleanup

# Post-install stuff
git lfs install
/usr/local/opt/fzf/install
pip3 install -U pip setuptools wheel
