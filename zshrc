# alias's
alias cp="cp -p"
alias mv="mv -i"
alias rm="rm -i"
alias la='ls -l'
alias ls="ls --color -F"
alias ll="ls --color -alF"
alias s="sudo"
alias screen='screen -xRU'
alias vi='vim'

# git alias
alias g='git'
alias gits='git status'
alias gitb='git branch'

# charset
export LANG=ja_JP.UTF-8

bindkey -e
export PATH=/opt/local/bin:/opt/local/sbin/:/Applications/android-sdk-mac_x86/tools:$PATH

setopt auto_pushd

# === Git Branch Info
git_prompt_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo "(${ref#refs/heads/})"
}

# === PROMPT ===
setopt prompt_subst
PROMPT=$'%{\e[32m%}[%~]%{\e[m%}\n%{\e[37m%}%U%n@%m%%%u%{\e[m%} '

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

RPROMPT=$'%1(v|%F{green}%1v%f|)'
# /=== PROMPT ===

export EDITOR=VIM
autoload -U compinit
compinit -u
autoload -U colors
colors

# 補完で大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
