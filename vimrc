set nocompatible

" Vundle設定ここから
set rtp+=~/dotfiles/.vim/vundle/
call vundle#rc()

Bundle 'Shougo/neocomplcache'
Bundle 'fholgado/minibufexpl.vim'
"Bundle 'Shougo/unite.vim'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'tpope/vim-surround'
"Bundle 'thinca/vim-puickrun'
"Bundle 'thinca/vim-ref'
"Bundle 'kana/vim-fakeclip'
Bundle 'vim-scripts/TwitVim'
Bundle 'Align'
Bundle 'pekepeke/titanium-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
" Vundle関連ここまで

syntax enable
colorscheme desert

" 256色対応のターミナルの場合
if &term =~ "xterm-256color"
  "colorscheme molokai
  set background=dark
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
  let g:solarized_visibility="medium"
  let g:solarized_contrast="high"
  let g:solarized_degrade=0
  let g:solarized_bold=1
  let g:solarized_underline=1
  let g:solarized_italic=1
  colorscheme solarized
endif

"ステータスラインを常に表示
set laststatus=2
set statusline=%F%m%r%h%w\ [%{&syntax}]\[%{&ff}]\[%{&fileencoding}]\[%p%%]\ %l/%L


" 全角スペース可視化
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

" バックアップをしない
set nobackup

" swpを作らない
set noswapfile

" インデントスタイル
"set autoindent
"set smartindent

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
au BufNewFile,BufRead *.py  set softtabstop=4 tabstop=4 shiftwidth=4 | set expandtab
au BufNewFile,BufRead *.rb  set softtabstop=2 tabstop=2 shiftwidth=2 | set expandtab
au BufNewFile,BufRead *.js  set softtabstop=2 tabstop=2 shiftwidth=2 | set expandtab
au BufNewFile,BufRead *.coffee  set softtabstop=2 tabstop=2 shiftwidth=2 | set expandtab

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
