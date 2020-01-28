# Allow ^D
set +o ignoreeof

# alias
alias ll="ls -bFlah --color"
alias ff="find . -name"

export PS1="[\u@\h] \w \$(__git_ps1 '(%s)')\n\$ "
