# Undo this from belak/zsh-utils/
unalias grep

# Replace ls with eza
alias ls='eza --icons --group-directories-first'
alias l='ls -1a'
alias ll='ls -l'
alias la='ll -a'

# sudo shortcut
alias _='sudo'

# `tre` is a shorthand for `eza` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
alias tre='ls -Ta -I ".git|node_modules|bower_components" --time-style=long-iso'

# Easy navigation through the directory stack
alias -- -='cd -'
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

alias g='git'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Mac specific
if is-macos
then
    # Update Homebrew packages, Mac apps, vim-plug plugins and antidote plugins
    # Then check for MacOS updates
    alias update='brew update; brew upgrade; mas upgrade; nvim +PlugUpdate +PlugUpgrade +PlugClean +qa; antidote update; softwareupdate -ia --all --verbose'

    # Flush Directory Service cache
    alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

    # Recursively delete `.DS_Store` files
    alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

    # Empty the Trash on all mounted volumes and the main HDD.
    # Also, clear Apple’s System Logs to improve shell startup speed.
    # Finally, clear download history from quarantine. https://mths.be/bum
    alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

    # Merge PDF files
    # Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
    alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/MacOS/join'
fi
