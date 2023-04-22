#!/bin/bash

# First, install Homebrew if it's not already installed
command -v brew > /dev/null ||
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Package lists
pkg_list=(
    bat
    bitwarden-cli
    ccache
    checkbashisms
    clang-format
    coreutils
    ctags
    exa
    exiftool
    fd
    fzf
    gh
    git
    git-lfs
    iperf3
    mas
    neofetch
    neovim
    pigz
    pixz
    python
    rename
    ripgrep
    shellcheck
    speedtest-cli
    tmux
    uncrustify
    youtube-dl
)
cask_list=(
    appcleaner
    coconutbattery
    docker
    firefox
    flycut
    iterm2
    logitech-g-hub
    macs-fan-control
    qbittorrent
    scroll-reverser
    spotify
    visual-studio-code
    vlc
)
mas_list=(
     585829637  # Todoist
    1147396723  # WhatsApp
    1246969117  # Steam Link
    1295203466  # Microsoft Remote Desktop
    1352778147  # Bitwarden
    1497506650  # Yubico Authenticator
    1529448980  # Reeder
)

# Install the packages
brew install "${pkg_list[@]}"
brew install --cask "${cask_list[@]}"
mas install "${mas_list[@]}"

# Remove outdated versions from the cellar.
brew cleanup

# Post-install stuff
git lfs install
/usr/local/opt/fzf/install
pip3 install -U pip setuptools wheel
