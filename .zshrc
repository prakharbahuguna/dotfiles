# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set this to where zplug should be installed
ZPLUG_HOME="${HOME}/.zplug"
# Install zplug if it's not already installed
if [ ! -d "${ZPLUG_HOME}" ]; then
    printf 'Installing zplug...\n'
    curl -sL --proto-redir -all,https \
        https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    sleep 3
fi

# Load in zplug
source "${ZPLUG_HOME}/init.zsh"

# Configure lugin settings
zstyle ':prezto:*:*' case-sensitive 'no'
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'
zstyle ':prezto:module:terminal:tab-title' format '%m: %s'
zstyle ':prezto:module:terminal:multiplexer-title' format '%s'
zstyle ':prezto:module:syntax-highlighting' highlighters 'main' 'brackets' 'line' 'cursor'
zstyle ':prezto:module:prompt' theme 'powerlevel10k'

# Let zplug manage itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# Specify prezto modules
zplug 'modules/environment', from:prezto
zplug 'modules/history', from:prezto
zplug 'modules/terminal', from:prezto
zplug 'modules/utility', from:prezto
zplug 'modules/tmux', from:prezto
zplug 'modules/completion', from:prezto
zplug 'modules/syntax-highlighting', from:prezto
zplug 'modules/history-substring-search', from:prezto
zplug 'modules/autosuggestions', from:prezto
zplug 'modules/prompt', from:prezto
zplug 'modules/directory', from:prezto
zplug 'modules/git', from:prezto
zplug 'modules/command-not-found', from:prezto
zplug 'modules/python', from:prezto
# Specify external modules
zplug 'MichaelAquilina/zsh-you-should-use'

# Install modules if they're not already installed
if ! zplug check; then
    zplug install
fi

# And load them.
zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
# Load FZF bindings, my aliases and functions
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
[ -f ~/.aliases.zsh ] && . ~/.aliases.zsh
[ -f ~/.functions.zsh ] && . ~/.functions.zsh
