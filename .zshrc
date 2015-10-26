# Set this to where antigen should be installed
ANTIGEN_DIR="$HOME/.antigen/install"
# Install antigen if it's not already installed
if [[ ! -d "$ANTIGEN_DIR" ]]; then
    mkdir -p "$ANTIGEN_DIR"
    git clone https://github.com/zsh-users/antigen "$ANTIGEN_DIR"
fi
# Load in antigen
source ~/.antigen/install/antigen.zsh
# Load config parameters
source ~/.zshconfig


# Load the oh-my-zsh library
antigen use oh-my-zsh

# OS X specific packages
if [[ $OSTYPE = darwin* ]]; then
    antigen bundle brew
    antigen bundle osx

    # Enable iTerm shell integration if available
    test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
fi

# Check if we're on Linux and load specific packages
if hash lsb_release &>/dev/null; then
    LINUX_RELEASE=$(lsb_release -si)

    # For Arch Linux
    if [[ $LINUX_RELEASE = "Arch" ]]; then
        antigen bundle archlinux
        antigen bundle systemd
    fi

    # For Ubuntu
    if [[ $LINUX_RELEASE = "Ubuntu" ]]; then
        antigen bundle ubuntu
    fi
fi

# Load up the rest of our packages
antigen bundle cp
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle extract
antigen bundle gitfast
antigen bundle rimraf/k
antigen bundle sudo
antigen bundle tmux
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k


# Tell antigen that you're done.
antigen apply


# Load custom aliases and functions
source ~/.aliases
source ~/.functions
