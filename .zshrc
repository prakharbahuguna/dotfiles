# Lazy-load (autoload) Zsh function files from a directory.
ZFUNCDIR=${ZDOTDIR}/zfunctions
fpath=($ZFUNCDIR $fpath)
autoload -Uz $ZFUNCDIR/*(.:t)

# Set any zstyles you might use for configuration.
[[ ! -f ${ZDOTDIR}/zstyles ]] || source ${ZDOTDIR}/zstyles

# Clone antidote if necessary.
if [[ ! -d ${ZDOTDIR}/antidote ]]; then
  git clone https://github.com/mattmc3/antidote ${ZDOTDIR}/antidote
fi

# Create an amazing Zsh config using antidote plugins.
source ${ZDOTDIR}/antidote/antidote.zsh
antidote load

# Source anything in zshrc.d.
for _rc in ${ZDOTDIR}/zshrc.d/*.zsh; do
  # Ignore tilde files.
  if [[ $_rc:t != '~'* ]]; then
    source "$_rc"
  fi
done
unset _rc

# Don't use viins keymap despite Neovim being set to $EDITOR
bindkey -e

eval "$(starship init zsh)"
