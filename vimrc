set nocompatible

" Vundle設定ここから
set rtp+=~/dotfiles/.vim/vundle/
call vundle#rc()

"Bundle 'andrewlkho/buftabs'
"Bundle 'Shougo/neocomplcache'
Bundle 'fholgado/minibufexpl.vim'
"Bundle 'Shougo/unite.vim'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'tpope/vim-surround'
"Bundle 'thinca/vim-puickrun'
"Bundle 'thinca/vim-ref'
"Bundle 'kana/vim-fakeclip'
Bundle 'vim-scripts/TwitVim'
" Vundle関連ここまで

colorscheme wombat

" 256色対応のターミナルの場合
if &term =~ "xterm-256color"
 colorscheme molokai
endif

"ステータスラインを常に表示
set laststatus=2
set statusline=%F%m%r%h%w\ [%{&syntax}]\[%{&ff}]\[%{&fileencoding}]\[%p%%]\ %l/%L

syntax on

" 全角スペース可視化
highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /??/

" タブ文字可視化
set list
set listchars=tab:^.

" コマンドライン補間をシェルっぽく
set wildmode=list:longest

set complete=.,w,b,u,k

" バックアップをしない
set nobackup

" swpを作らない
set noswapfile

" インデントスタイル
set smartindent

" タブ幅設定
set smarttab

set backspace=indent,eol,start

"検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" インクリメンタルサーチ
set incsearch

"検索結果文字列のハイライトを有効にしない
set nohlsearch

set showmatch

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

set tabstop=4
set shiftwidth=4
set softtabstop=4

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

"php syntax
au BufNewFile,BufRead *.php set softtabstop=4 | set tabstop=4 | set shiftwidth=4 | set noexpandtab

"html syntax
au BufNewFile,BufRead *.html set shiftwidth=2 | set expandtab
" cakeのテンプレートもhtml syntaxで
au BufNewFile,BufRead *.ctp  set shiftwidth=2 | set expandtab

" neocomplcache
"let g:neocomplcache_enable_at_startup = 1

" minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
