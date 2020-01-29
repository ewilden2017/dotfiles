# Allow ^D
set +o ignoreeof

# alias
alias ll="ls -bFlah --color"
alias ff="find . -name"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="[\u@\h] \w \$(parse_git_branch)\n\$ "
