# Set this to where zgen should be installed
ZGEN_DIR="$HOME/.zgen"
# Install zgen if it's not already installed
if [[ ! -d "$ZGEN_DIR" ]]; then
    mkdir -p "$ZGEN_DIR"
    git clone https://github.com/tarjoilija/zgen "$ZGEN_DIR"
fi

# Load in zgen
source $ZGEN_DIR/zgen.zsh
# Load config parameters
source ~/.zshconfig


if ! zgen saved; then
    # Load the oh-my-zsh library
    zgen oh-my-zsh

    # OS X specific packages
    if [[ $OSTYPE = darwin* ]]; then
        zgen oh-my-zsh plugins/brew
        zgen oh-my-zsh plugins/osx

        # Enable iTerm shell integration if available
        test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
    fi

    # Check if we're on Linux and load specific packages
    if hash lsb_release &>/dev/null; then
        LINUX_RELEASE=$(lsb_release -si)

        # For Arch Linux
        if [[ $LINUX_RELEASE = "Arch" ]]; then
            zgen oh-my-zsh plugins/archlinux
            zgen oh-my-zsh plugins/systemd
        fi

        # For Ubuntu
        if [[ $LINUX_RELEASE = "Ubuntu" ]]; then
            zgen oh-my-zsh plugins/ubuntu
        fi
    fi

    # Load up the rest of our packages
    for package in $ZGEN_OH_MY_ZSH_PACKAGES; do
        zgen oh-my-zsh plugins/$package
    done
    for package in $ZGEN_OTHER_PACKAGES; do
        zgen load $package
    done

    # Load the theme.
    zgen load bhilburn/powerlevel9k powerlevel9k

    # Save the config
    zgen save
fi


# Load custom aliases, functions and exports
source ~/.aliases
source ~/.functions
source ~/.exports
