" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

" 非互換モード
set nocompatible

" 行番号表示
set number

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

" 補完
Bundle 'Shougo/neocomplcache'
" バッファ表示
Bundle 'fholgado/minibufexpl.vim'
" vimからTwitter投稿
Bundle 'vim-scripts/TwitVim'
" 行揃え用
Bundle 'Align'
" Titanium用
Bundle 'pekepeke/titanium-vim'
" より良いgrep
Bundle 'mileszs/ack.vim'
" vimからgist投稿
Bundle 'mattn/gist-vim'
" gist-vim用
Bundle 'mattn/webapi-vim'
" jsの補完
Bundle 'pangloss/vim-javascript'
" js シンタックスチェック
Bundle 'basyura/jslint.vim'
" solarized colorscheme
Bundle 'altercation/vim-colors-solarized'
" rails用
Bundle 'tpope/vim-rails'
" ディレクトリファイルツリー表示
Bundle 'scrooloose/nerdtree'
" インデント表示
Bundle 'nathanaelkane/vim-indent-guides'

" ---------------------------------------------------------------------------
" Colorscheme
" ---------------------------------------------------------------------------

syntax enable
set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
colorscheme solarized
"colorscheme railscasts2

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
set listchars=eol:¬,tab:▸\ 

" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu

" バックアップをしない
set nobackup

" swpを作らない
set noswapfile

" インデントスタイル
set autoindent
set smartindent

" タブ幅設定
set smarttab

" バックスペースの挙動
set backspace=indent,eol,start

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" インクリメンタルサーチ
set incsearch

" 対応する括弧を強調表示
set showmatch

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

set tabstop=4
set shiftwidth=4
set softtabstop=4

filetype on
filetype plugin on
filetype indent on

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

" podspec
au BufNewFile,BufRead *.podspec  set softtabstop=2 tabstop=2 shiftwidth=2 | set expandtab

" ---------------------------------------------------------------------------
" keymappings
" ---------------------------------------------------------------------------
" Escの2回押しでハイライト消去
set hlsearch
noremap <Esc><Esc> :nohlsearch<CR><Esc>

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> :<C-w>j
nnoremap <C-k> :<C-k>j
nnoremap <C-l> :<C-l>j
nnoremap <C-h> :<C-h>j

" MiniBufExplorer で GNU screen likeなキーバインド
let mapleader = ""
nmap <S-Space> :MBEbp<CR>
nmap <Space> :MBEbn<CR>
nnoremap <C-X><C-N> :new<CR>
nnoremap <C-X><C-K> :bd<CR>

" コロンとセミコロン入れ替え
"noremap ; :
"noremap : ;

" ---------------------------------------------------------------------------
" plugin settings
" ---------------------------------------------------------------------------

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1

" minibuffer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget=1
let g:miniBufExplSplitToEdge=1

" jslint.vim
function! s:javascript_filetype_settings()
	autocmd BufLeave     <buffer> call jslint#clear()
	autocmd BufWritePost <buffer> call jslint#check()
	autocmd CursorMoved  <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

" :makeでcolsure compilerを使って文法チェック
autocmd FileType javascript :compiler gjslint
autocmd QuickfixCmdPost make copen

" インデントの色付け幅
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=235
