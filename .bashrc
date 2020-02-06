# Allow ^D
set +o ignoreeof

# alias
alias ll="ls -bFlah --color"
alias ff="find . -name"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#export PS1="[\u@\h] \w \$(parse_git_branch)\n\$ "

# Color version
export PS1="\[\033[01;39m\][\u@\h]\[\033[01;34m\] \w\[\033[01;36m\]\$(parse_git_branch)\n\[\033[01;34m\]\$ \[\033[00m\]"
