# -*- sh -*-
#

# check for macports bash completion
test -f /opt/local/etc/bash_completion && {
    source /opt/local/etc/bash_completion
}

# want a history file
export HISTFILE=~/.bash_history
export HISTFILESIZE=10000
shopt -s histappend

# exclude some directories from common tools
alias grep='grep --exclude=".svn" --exclude=".git" --exclude-dir=CVS'
alias ack='ack-5.12 --pager="less -R"'
export FIGNORE=".svn:.git:CVS:~"

# make sure we have a proper light-weight editor for all those commits
export EDITOR=vim
export SVN_EDITOR=$EDITOR

# set a rather complicated prompt :-/
export GIT_PS1_SHOWDIRTYSTATE=true     # * for unstaged, + for staged
export GIT_PS1_SHOWSTASHSTATE=true     # $ if stashes in repo
export GIT_PS1_SHOWUNTRACKEDFILES=true # % if untracked files in repo
export PS1='$(__git_ps1 "(\[\033[0;32m\]%s\[\033[m\]) ")\w \[\033[1;37m\]\$\[\033[m\] '
