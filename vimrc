let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'danishprakash/vim-githubinator'
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/vim-gfm-syntax'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/limelight.vim'
call plug#end()
syntax on
filetype plugin indent on

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set undolevels=1000
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set number relativenumber 
set numberwidth=5
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                        " Enhanced command line completion.
set wildmode=list:longest,list:full " Complete files like a shell.

" Files to ignore
" Python
set wildignore+=*.pyc,*.pyo,*/__pycache__/*
" Erlang
set wildignore+=*.beam
" Temp files
set wildignore+=*.swp,~*
" Archives
set wildignore+=*.zip,*.tar

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
autocmd Filetype py setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set nojoinspaces

" Theme

colorscheme jellybeans

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=80
" highlight ColorColumn ctermbg=7

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set cursorline
highlight CursorLine ctermbg=235 cterm=none

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Get to fzf more quickly
nnoremap <C-p> :FZF<cr>
" Remap escape
inoremap jk <Esc>
" fzf
set rtp+=/usr/local/opt/fzf
