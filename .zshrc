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

# Correction
setopt CORRECT
setopt CORRECT_ALL

alias ls='ls -bF --color'
alias ll='ls -bFlah --color'
alias ff="find . -name"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

NEWLINE=$'\n'

# Color version
setopt prompt_subst
export  PROMPT="%F{27}%B[%n@%m] %10~%b%(?.. %F{88}[%?])%f %F{39}\$(parse_git_branch)%f ${NEWLINE}%# "
