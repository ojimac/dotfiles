" Vundleここから
set nocompatible
filetype off

set rtp+=~/dotfiles/.vim/vundle/
call vundle#rc()

Bundle 'andrewlkho/buftabs'
Bundle 'Shougo/neocomplcache'
" Vundle関連ここまで

"colorscheme desert
colorscheme wombat

" 256色対応のターミナルの場合
if &term =~ "xterm-256color"
 "colorscheme desert256
 "colorscheme inkpot
 "colorscheme mrkn256
 colorscheme molokai
endif

set laststatus=2
:set statusline=%F%m%r%h%w\ [%{&syntax}]\[%{&ff}]\[%{&fileencoding}]\[%p%%]\ %l/%L

syntax on

highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /??/

" タブ文字可視化
set list
set listchars=tab:^.

set wildmode=longest,list

set complete=.,w,b,u,k

set nobackup

set autoread

" インデントスタイル
set autoindent
set smartindent

" タブ幅設定
set smarttab
set softtabstop=4 tabstop=4 shiftwidth=4

set backspace=indent,eol,start

set ignorecase
set smartcase

" インクリメンタルサーチ
set incsearch

set showmatch

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

"hilight                
set hlsearch

"cakephp template syntax highlighting
autocmd BufNewFile,BufRead *.ctp set filetype=php

" カーソル位置を目立たせる
:set cursorline

" buftab
let g:buftabs_only_basename=1 " ファイル名だけ表示

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
