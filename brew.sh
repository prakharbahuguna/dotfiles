#!/bin/zsh

if [[ $OSTYPE != *darwin* ]]
then
    echo 'This script is only for MacOS'
    exit 1
fi

# First, install Homebrew if it's not already installed
command -v brew > /dev/null ||
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Upgrade any already-installed formulae.
brew update
brew upgrade

# Package lists
pkg_list=(
    bat
    ccache
    checkbashisms
    clang-format
    exiftool
    eza
    fd
    fzf
    gh
    go
    mas
    neovim
    python
    rename
    ripgrep
    ruff
    rust
    shellcheck
    uv
    yt-dlp
)
cask_list=(
    appcleaner
    calibre
    fastmail
    ghostty
    logitech-g-hub
    obsidian
    scroll-reverser
    signal
    tidal
    vlc
    zed
    zen
)
mas_list=(
    310633997   # WhatsApp
    1352778147  # Bitwarden
    1497506650  # Yubico Authenticator
)

# Install the packages
brew install "${pkg_list[@]}"
brew install --cask "${cask_list[@]}"
mas install "${mas_list[@]}"

# Remove outdated versions from the cellar.
brew cleanup

# Post-install stuff
pushd /opt/homebrew/bin
for i in {,e,f,z,ze,zf}grep
    do cp -s ugrep $i
done
popd
