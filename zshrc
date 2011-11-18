# alias
alias cp="cp -p"
alias mv="mv -i"
alias rm="rm -i"
alias la='ls -l'
alias ls="ls --color -F"
alias ll="ls --color -alF"
alias s="sudo"
alias screen='screen -xRU'
alias v='vim'

# git alias
alias g='git'
alias gits='git status'
alias gitb='git branch'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias glp="git log -p --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gpush="git push origin master"
alias gpull="git pull origin master"

# charset
export LANG=ja_JP.UTF-8

# emcasキーバインド
bindkey -e

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

# ls時の色設定
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# screenで実行コマンドを表示する
case "${TERM}" in screen)
	preexec() {
		echo -ne "\ek${1%% *}\e\\"
	}
	precmd() {
		echo -ne "\ek$(basename $(pwd))\e\\"
	}
esac
