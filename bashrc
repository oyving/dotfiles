# -*- sh -*-
#

# check for Ubuntu bash completion
if [ -d /etc/bash_completion.d ]; then
    source /etc/bash.bashrc
    source /etc/bash_completion
fi

# check for macports bash completion (and other helpful things)
if [ -d /opt/local/etc/profile.d ]; then
	for file in /opt/local/etc/profile.d/*; do
		source $file
	done
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
export PS1='$(__git_ps1 "(\[\033[0;32m\]%s\[\033[m\]) ")\w \[\033[1;37m\]\$\[\033[m\] '

case "$(uname)" in
    Darwin)
        PATH=$HOME/Library/Python/2.7/bin:$PATH
        alias ls='ls -G'
        ;;
esac

