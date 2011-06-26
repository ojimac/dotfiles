"color
colorscheme desert

set laststatus=2

:set statusline=%F%m%r%h%w\ [%{&syntax}]\[%{&ff}]\[%{&fileencoding}]\[%04l,%04v][%p%%]\ %l/%L
"set statusline=%F%m%r%h%w\ [%{&syntax}]\[%{&ff}]\[%{&fileencoding}]\[%p%%]\ %l/%L
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
syntax on

highlight ZenkakuSpace ctermbg=6
set listchars=tab:>.
set list

set wildmode=longest,list

set complete=.,w,b,u,k

set nobackup

set autoread

set autoindent smartindent

set smarttab
set softtabstop=4 tabstop=4 shiftwidth=4

set backspace=indent,eol,start

set ignorecase smartcase

set incsearch

set showmatch

set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8

"hilight                
set hlsearch

" To enable Changelog plugin
filetype plugin on
filetype indent on

" Enable to interpret .changelog files as a changelog filetype
au BufNewFile,BufRead *.changelog setf changelogfiletype plugin on

" Changelog setting
:let g:changelog_timeformat = "%Y-%m-%d"
:let g:changelog_username = "ojimac <ojimac@gmail.com>"
