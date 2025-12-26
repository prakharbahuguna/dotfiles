#!/bin/zsh
#
# .zshenv - Zsh environment file, loaded always.
#

# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!

# Set ZDOTDIR if you want to re-home Zsh.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Editors
export EDITOR='nvim'
export VISUAL='zed --wait'
export MANPAGER='bat -pl man'

if [[ -z "$LANG" ]]; then
  export LANG='en_GB.UTF-8'
fi

# Configure FZF options
FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
FZF_CTRL_T_OPTS="--select-1 --exit-0"
FZF_CTRL_R_OPTS="--exact --preview 'echo {}' --preview-window down:3:hidden --bind '?:toggle-preview'"
FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'tree -C {} | head -200'"
