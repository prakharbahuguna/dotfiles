#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install other useful binaries.
brew install ack
brew install axel
brew install ccache
brew install ctags
brew install git-lfs
brew install --with-ncurses htop
brew install iperf3
brew install isync
brew install --with-pinentry --with-doc lastpass-cli
brew install msmtp
brew install --with-gpgme --with-libidn --with-notmuch-patch --with-sidebar-patch neomutt/homebrew-neomutt/neomutt
brew install --with-release neovim/neovim/neovim
brew install notmuch
brew install p7zip
brew install pigz
brew install pixz
brew install pv
brew install rename
brew install --with-wrap-pbcopy-and-pbpaste --with-wrap-launchctl reattach-to-user-namespace
brew install speedtest_cli
brew install ssh-copy-id
brew install tmux
brew install tree
brew install uncrustify
brew install youtube-dl

# Remove outdated versions from the cellar.
brew cleanup -s --force
