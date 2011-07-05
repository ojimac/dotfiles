"colorscheme desert
colorscheme wombat
"colorscheme denim
"colorscheme solarized

if &term =~ "xterm-256color"
 " colorscheme desert256
 colorscheme inkpot
 "colorscheme mrkn256
endif
"set background=dark

set laststatus=2

:set statusline=%F%m%r%h%w\ [%{&syntax}]\[%{&ff}]\[%{&fileencoding}]\[%p%%]\ %l/%L
syntax on

highlight ZenkakuSpace ctermbg=6
match ZenkakuSpace /??/
set listchars=tab:^.
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

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8

"hilight                
set hlsearch

"cakephp template syntax highlighting
autocmd BufNewFile,BufRead *.ctp set filetype=php
