# Load in antigen
source ~/.antigen/install/antigen.zsh
# Load config for ZSH features
source ~/.zshconfig

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle command-not-found
antigen bundle gitfast
antigen bundle brew
antigen bundle osx
antigen bundle colored-man-pages
antigen bundle cp
antigen bundle extract
antigen bundle sudo
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell antigen that you're done.
antigen apply

# Load custom aliases and functions
source ~/.aliases
source ~/.functions
