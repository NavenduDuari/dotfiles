# If local bashrc is present then, take that as well

set -o vi

. ~/.dotfiles/bash/.env

. ~/.dotfiles/bash/.prompt

. ~/.dotfiles/bash/.alias

. ~/.dotfiles/bash/.functions

. ~/.dotfiles/bash/.path

. ~/.dotfiles/bash/libs/z/z.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f ~/.local/bin/bashmarks.sh ] && source ~/.local/bin/bashmarks.sh

# if [ -f ~/.bashrc ]; then
#     . ~/.bashrc
# fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# VS code window throws error
update_terminal_cwd() {
    # Identify the directory using a "file:" scheme URL,
    # including the host name to disambiguate local vs.
    # remote connections. Percent-escape spaces.
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi
