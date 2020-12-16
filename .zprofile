#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='code'
export VISUAL='code'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_GB.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
# path=(
#   $cdpath
# )

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -X -w -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Ensure SSH_AUTH_SOCK is always available from the same location, even if you
# disconnect and later reattach to a tmux session
SOCK="/tmp/ssh-agent-${USER}-tmux"
if [ "${SSH_AUTH_SOCK}" ] && [ "${SSH_AUTH_SOCK}" != "${SOCK}" ]; then
    rm -f "/tmp/ssh-agent-${USER}-screen"
    ln -sf "${SSH_AUTH_SOCK}" "${SOCK}"
    export SSH_AUTH_SOCK="${SOCK}"
fi

# Configure FZF options
FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
FZF_TMUX=1
FZF_TMUX_HEIGHT=30%
FZF_CTRL_T_OPTS="--select-1 --exit-0"
FZF_CTRL_R_OPTS="--exact --preview 'echo {}' --preview-window down:3:hidden --bind '?:toggle-preview'"
FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'tree -C {} | head -200'"
