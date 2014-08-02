" This setting prevents vim from emulating the original vi's bugs and limitations.
set nocompatible
" Set default encoding to UTF-8.
set encoding=utf-8 fileencodings=

syntax enable 

set number

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

let g:hybrid_use_Xresources = 1
colorscheme hybrid

" The first setting sets up 2-space tabs, the second tells vi to use 2 spaces when text is indented (auto or with the manual indent adjustmenters), and the third tells vi not to auto-replace spaces with tab characters.
set softtabstop=2
set shiftwidth=2
set expandtab

" Highlight search matches
set incsearch
set hlsearch

" Enable filetype-specific indenting and plugins
filetype on
filetype indent on
filetype plugin on

" This setting ensures that each window contains a statusline that displays the current cursor position.
set ruler
set cmdheight=1
set laststatus=2
set statusline=%F%h%m%w%r\ %Y\ (%{&ff})%=\ %c%V,\ %l/%L\ (%P)

" Use bash instead of sh
set shell=/bin/bash

set visualbell                    " No beeping.

nmap :Q! :q!
nmap :WQ! :wq!

