# -*- sh -*-
#

# some places do not have the ubuntu completion, so we maintain a local copy
# check if we have it, and if not load our own
if [ -d /etc/bash_completion.d ]; then
    source /etc/bash.bashrc
    source /etc/bash_completion
elif [ -f /opt/local/etc/bash_completion ]; then
    source /opt/local/etc/bash_completion
else
    source ./bash.d/ubuntu
    source ./bash.d/completion
fi

# exclude some directories from common tools
alias grep='grep --exclude-dir=".svn" --exclude-dir=".git" --exclude-dir=CVS'
export FIGNORE=".svn:.git:CVS:~"

# make sure we have a proper light-weight editor for all those commits
export EDITOR=vim
export SVN_EDITOR=$EDITOR

# set a rather complicated prompt :-/
export GIT_PS1_SHOWDIRTYSTATE=true     # * for unstaged, + for staged
export GIT_PS1_SHOWSTASHSTATE=true     # $ if stashes in repo
export GIT_PS1_SHOWUNTRACKEDFILES=true # % if untracked files in repo
export PS1='$(__git_ps1 "(%s) ")\w \$ '

case "$(uname)" in
    Darwin)
        PATH=$HOME/Library/Python/2.7/bin:$PATH
        alias ls='ls -G'
        ;;
esac

