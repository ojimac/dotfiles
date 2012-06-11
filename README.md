# 各種ドットファイルの管理用リポジトリ

- vim
- zsh
- screen
- git

まわりの管理と、初期設定用のpythonスクリプトで構成されています。

## vim

~/.vimrcには

    " 共通の.vimrc
    if filereadable(expand('~/dotfiles/vimrc'))
      source ~/dotfiles/vimrc
    endif

    " 環境依存の.vimrc
    if filereadable(expand('~/.vimrc.local'))
      source ~/.vimrc.local
    endif

だけを書き、gitで管理するのはdotfiles/vimrc、gitで管理しづらい環境依存のaliasやpath等は.vimrc.localに書くようにします。

また、.vimディレクトリは、ホームディレクトリで、

	$ ln -s ~/dotfiles/.vim .vim

としておき、実体はdotfiles配下の.vimディレクトリを見るようにしておきます。

## zsh

vimまわりと同様に、gitで管理する設定と、管理外の設定に分けています。
                                                                                                                      
    # 共通のzshrc
    [ -f ${HOME}/dotfiles/zshrc ] && source ${HOME}/dotfiles/zshrc                                                    
                                                                                                                      
    # 環境依存のzshrc                                                                                                 
    [ -f ${HOME}/.zshrc.local ] && source ${HOME}/.zshrc.local

## screen

$HOME/.screenrcは、dotfiles/screenrcのシンボリックリンクになるようにします。

※ セットアップ用スクリプトで行います

## git

$HOME/.gitconfigは、dotfiles/gitconfigのシンボリックリンクになるようにします。

※ セットアップ用スクリプトで行います

## setup.py

	$ ./setup.py

を実行することで、

- .vimrc作成
- .vimrc.local作成
- .vimディレクトリのシンボリックリンク設定
- .zshrc作成
- .zshrc.local作成
- .screenrcのシンボリックリンク設定
- .gitconfigのシンボリックリンク設定

を自動化します。
