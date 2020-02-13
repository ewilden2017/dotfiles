# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
# End of lines configured by zsh-newuser-install

# Compinit

# partial completeion
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
autoload -Uz compinit
compinit

# Enable ctrl-R reverse search
bindkey -v
bindkey '^R' history-incremental-pattern-search-backward
bindkey -v '^?' backward-delete-char

# Searching
bindkey -M vicmd '?' history-incremental-pattern-search-backward
bindkey -M vicmd '/' history-incremental-pattern-search-forward

bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Make switch to cmd mode faster
export KEYTIMEOUT=1

# Correction
setopt CORRECT
setopt CORRECT_ALL

alias ls='ls -bF --color'
alias ll='ls -bFlah --color'
alias ff="find . -name"
alias grep='grep --color'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

NEWLINE=$'\n'
MAIN_COLOR=109
SECONDARY_COLOR=246
ERROR_COLOR=124

# Color version
setopt prompt_subst
export  PROMPT="%F{white}%B[%n@%m] %F{${MAIN_COLOR}}%10~%b%(?.. %F{${ERROR_COLOR}}[%?])%f %F{${SECONDARY_COLOR}}\$(parse_git_branch)%f ${NEWLINE}%# "
