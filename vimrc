" Vundleここから
set nocompatible
filetype off

set rtp+=~/dotfiles/.vim/vundle/
call vundle#rc()

"Bundle 'andrewlkho/buftabs'
Bundle 'Shougo/neocomplcache'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'Shougo/unite.vim'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'tpope/vim-surround'
"Bundle 'thinca/vim-puickrun'
"Bundle 'thinca/vim-ref'
"Bundle 'kana/vim-fakeclip'
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

"ステータスラインを常に表示
set laststatus=2
:set statusline=%F%m%r%h%w\ [%{&syntax}]\[%{&ff}]\[%{&fileencoding}]\[%p%%]\ %l/%L

syntax on

highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /??/

" タブ文字可視化
set list
set listchars=tab:^.

" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
" set wildmenu
" コマンドライン補間をシェルっぽく
set wildmode=list:longest
"set wildmode=longest,list

set complete=.,w,b,u,k

set nobackup

set autoread

" インデントスタイル
"set autoindent
"set smartindent

" タブ幅設定
set smarttab
set softtabstop=4 tabstop=4 shiftwidth=4

set backspace=indent,eol,start

"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" インクリメンタルサーチ
set incsearch

"検索結果文字列のハイライトを有効にしない
set nohlsearch
"set hlsearch

set showmatch

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

"cakephp template syntax highlighting
autocmd BufNewFile,BufRead *.ctp set filetype=php

" カーソル位置を目立たせる
:set cursorline

" Enable filetype plugin
filetype plugin on
"filetype indent on

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
