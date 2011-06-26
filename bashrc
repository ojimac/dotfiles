# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
PATH=/usr/local/bin
PATH=$PATH:/sbin
PATH=$PATH:/usr/sbin
PATH=$PATH:/bin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/X11R6/bin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/mysql/bin
PATH=/opt/local/bin:$PATH
MANPATH=/usr/share/man:/usr/X11R6/man:/usr/local/man
MANPATH=/opt/local/share/man:$MANPATH

export LANG=ja_JP.UTF-8


BLOCKSIZE=K;    export BLOCKSIZE
EDITOR=vi;      export EDITOR
PAGER=more;     export PAGER
PERL_BADLANG=0; export PERL_BADLANG

#Set Prompt
PS1='\[\033[32m\][\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]$(__git_ps1 "(%s)")-> \[\033[0m\]'

alias ls="ls -SF"
alias ll="ls -laF"
alias la="ls -al"
alias cp="cp -p"
alias mv="mv -i"
alias rm="rm -i"
alias vi="vim"
alias g="git"
alias gits="git status"
alias gitb="git branch"

if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi
