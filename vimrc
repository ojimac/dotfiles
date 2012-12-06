" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

" 非互換モード
set nocompatible

" ---------------------------------------------------------------------------
" functions
" ---------------------------------------------------------------------------

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" ---------------------------------------------------------------------------
" Vundle
" ---------------------------------------------------------------------------

set rtp+=~/dotfiles/.vim/vundle/
call vundle#rc()

Bundle 'Shougo/neocomplcache'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'vim-scripts/TwitVim'
Bundle 'Align'
Bundle 'pekepeke/titanium-vim'
Bundle 'mileszs/ack.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'pangloss/vim-javascript'
Bundle 'basyura/jslint.vim'

" ---------------------------------------------------------------------------
" Colorscheme
" ---------------------------------------------------------------------------

syntax enable
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

" ---------------------------------------------------------------------------
" UI
" ---------------------------------------------------------------------------

"ステータスラインを常に表示
set laststatus=2
set statusline=%F%m%r%h%w\ [%{&syntax}]\[%{&ff}]\[%{&fileencoding}]\[%p%%]\ %l/%L

" 全角スペース可視化
highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /??/

" タブ文字可視化
set list
"set listchars=tab:^.
set listchars=eol:¬,tab:▸\ 

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
set autoindent
set smartindent

" タブ幅設定
set smarttab

set backspace=indent,eol,start

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" インクリメンタルサーチ
set incsearch

" 検索結果文字列のハイライトを有効にしない
"set nohlsearch

set showmatch

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

set tabstop=4
set shiftwidth=4
set softtabstop=4

filetype plugin indent on

" ---------------------------------------------------------------------------
" syntax
" ---------------------------------------------------------------------------

" txt
au BufNewFile,BufRead *.txt set softtabstop=4 tabstop=4 shiftwidth=4 | set expandtab

" php
au BufNewFile,BufRead *.php set softtabstop=4 | set tabstop=4 | set shiftwidth=4 | set noexpandtab

" html
au BufNewFile,BufRead *.html set shiftwidth=2 | set expandtab

" cake template file
au BufNewFile,BufRead *.ctp  set shiftwidth=2 | set expandtab

" python
au BufNewFile,BufRead *.py  set softtabstop=4 tabstop=4 shiftwidth=4 | set expandtab

" ruby
au BufNewFile,BufRead *.rb  set softtabstop=2 tabstop=2 shiftwidth=2 | set expandtab

" erb
au BufNewFile,BufRead *.erb  set softtabstop=2 tabstop=2 shiftwidth=2 | set expandtab

" javascript
au BufNewFile,BufRead *.js  set softtabstop=2 tabstop=2 shiftwidth=2 | set expandtab

" cofeescript
au BufNewFile,BufRead *.coffee  set softtabstop=2 tabstop=2 shiftwidth=2 | set expandtab

" ---------------------------------------------------------------------------
" keymappings
" ---------------------------------------------------------------------------
" コロンとセミコロン入れ替え
noremap ; :
noremap : ;

" Escの2回押しでハイライト消去
set hlsearch
noremap <Esc><Esc> :nohlsearch<CR><Esc>

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> :<C-w>j
nnoremap <C-k> :<C-k>j
nnoremap <C-l> :<C-l>j
nnoremap <C-h> :<C-h>j

" ---------------------------------------------------------------------------
" plugin settings
" ---------------------------------------------------------------------------

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" minibuffer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1
" MiniBufExplorer で GNU screen likeなキーバインド
let mapleader = ""
nmap <S-Space> :MBEbp<CR>
nmap <Space> :MBEbn<CR>
nnoremap <C-X><C-N> :new<CR>
nnoremap <C-X><C-K> :bd<CR>
let mapleader = '\'

" jslint.vim
function! s:javascript_filetype_settings()
	autocmd BufLeave     <buffer> call jslint#clear()
	autocmd BufWritePost <buffer> call jslint#check()
	autocmd CursorMoved  <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

" :makeでcolsure compilerを使って文法チェック
"autocmd FileType javascript :compiler gjslint
"autocmd QuickfixCmdPost make copen
