#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install other useful binaries.
brew install ctags
brew install dark-mode
brew install --with-blk-sha1 git
brew install git-lfs
brew install iperf
brew install --with-pinentry --with-doc lastpass-cli
brew install node
brew install p7zip
brew install pigz
brew install pv
brew install python3
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install uncrustify

# Remove outdated versions from the cellar.
brew cleanup
