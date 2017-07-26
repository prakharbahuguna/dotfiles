#!/usr/bin/env bash

# First, install Homebrew if it's not already installed
command -v brew &> /dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install other useful binaries.
brew install axel
brew install ccache
brew install ctags
brew install fzf
brew install git-lfs
brew install git-review
brew install iperf3
brew install --with-pinentry --with-doc lastpass-cli
brew install mobile-shell
brew install neovim
brew install p7zip
brew install pigz
brew install pixz
brew install pv
brew install python3
brew install rename
brew install --with-wrap-pbcopy-and-pbpaste --with-wrap-launchctl reattach-to-user-namespace
brew install ripgrep
brew install speedtest_cli
brew install ssh-copy-id
brew install tmux
brew install tree
brew install uncrustify
brew install youtube-dl

# Remove outdated versions from the cellar.
brew cleanup -s

# Prerequisited for nvim
pip3 install neovim

# Install FZF bindings
/usr/local/opt/fzf/install
