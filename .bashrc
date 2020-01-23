#
# default .bashrc.local for computer sciences users
# 
# $Id: .bashrc.local,v 1.3 2013/07/16 14:58:44 pdickey Exp $
#

# Local modifications to a user's bash configuration
#
# For example, to set a default printer, one could uncomment the following
# and change the printer name appropriately
# 
# export PRINTER=<PRINTER>

# Adding an additional directory to the search path; the example below 
# will add <NEWPATH> to the end of your search path. You can look in .bashrc
# for additional examples.
# 
# export PATH=$PATH:<NEWPATH>

# Allow ^D
set +o ignoreeof

# alias
alias ll="ls -bFlah --color"
alias ff="find . -name"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#export PS1="[\u@\h] \w $(parse_git_branch)\n$ "
