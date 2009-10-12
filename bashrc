# -*- sh -*-
#

# some places do not have the ubuntu completion, so we maintain a local copy
# check if we have it, and if not load our own
if [ ! -d /etc/bash_completion.d ]; then
    source ./bash.d/ubuntu
    source ./bash.d/completion
else
    source /etc/bash.bashrc
    source /etc/bash_completion
fi

# exclude some directories from common tools
alias grep='grep --exclude-dir=".svn" --exclude-dir=".git" --exclude-dir=CVS'
export FIGNORE=.svn:.git:CVS

# make sure we have a proper light-weight editor for all those commits
export EDITOR=vim
export SVN_EDITOR=$EDITOR

# set a rather complicated prompt :-/
export PS1=': ${debian_chroot:+($debian_chroot)}\[\033[0;32m\]\h\[\033[m\] $(__git_ps1 "%s ")\w\[\033[1;37m\]\$\[\033[m\] '