execute pathogen#infect()
syntax on
filetype plugin indent on

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set number
set numberwidth=5

set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                        " Enhanced command line completion.
set wildmode=list:longest,list:full " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set nojoinspaces

" Theme

colorscheme jellybeans

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=7

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set cursorline
highlight CursorLine ctermbg=235 cterm=none
