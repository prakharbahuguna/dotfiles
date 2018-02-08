# Set this to where zplug should be installed
ZPLUG_HOME="${HOME}/.zplug"
# Install zplug if it's not already installed
if [ ! -d "${ZPLUG_HOME}" ]; then
    curl -sL --proto-redir -all,https \
        https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# Load config parameters
. ./.zshconfig
# Load in zplug
. "${ZPLUG_HOME}/init.zsh"


# Let zplug manage itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# Load oh-my-zsh default stuff
zplug 'robbyrussell/oh-my-zsh', use:"oh-my-zsh.sh"

# MacOS packages
zplug 'plugins/osx', from:"oh-my-zsh", if:"[ $(uname) = Darwin ]"

# Linux packages
if [ "$(uname)" = "Linux" ]; then
    zplug 'plugins/ubuntu', from:"oh-my-zsh", if:"[ $(lsb_release -si) = Ubuntu ]"
fi

# Load up the rest of our packages
for package in ${_ZPLUG_OMZ_PACKAGES}; do
    zplug "plugins/${package}", from:"oh-my-zsh"
done
for package in ${_ZPLUG_OTHER_PACKAGES}; do
    zplug "${package}"
done

# Load the theme.
zplug "${_ZPLUG_THEME}", as:theme

if ! zplug check; then
    zplug install
fi

zplug load


# Load custom aliases, functions and exports
. ./.aliases
. ./.functions
. ./.exports

# Load in FZF bindings for fun and profit
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
