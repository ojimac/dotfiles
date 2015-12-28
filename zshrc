# alias
alias cp="cp -p"
alias mv="mv -i"
alias rm="rm -i"
alias la='ls -l'
alias ls="ls -FG"
alias ll="ls -alFG"
alias s="sudo"
alias screen='screen -xRU'
alias v='vim'
alias vi='vim'

# git alias
alias g='git'
alias gits='git status'
alias gitb='git branch'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias glp="git log -p --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gpush="git push origin master"
alias gpull="git pull origin master"
alias gco="git checkout master"

# charset
export LANG=ja_JP.UTF-8

# emcasキーバインド
bindkey -e

setopt auto_pushd

export EDITOR=VIM
autoload -U compinit
compinit -u
autoload -U colors
colors

# 補完で大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 履歴関連
HISTFILE=$HOME/.zsh-history           # 履歴をファイルに保存する
HISTSIZE=100000                       # メモリ内の履歴の数
SAVEHIST=100000                       # 保存される履歴の数
setopt extended_history               # 履歴ファイルに時刻を記録
function history-all { history -E 1 } # 全履歴の一覧を出力する

# z
#. /usr/local/etc/profile.d/z.sh
#function _Z_precmd {
#  z --add "$(pwd -P)" 61 }
#precmd_functions=($precmd_functions _Z_precmd)
