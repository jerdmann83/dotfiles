set nocompatible
execute pathogen#infect()

set noswapfile
set clipboard+=unnamed
set go+=a
set autoread

"appearance stuff
syntax on
filetype plugin indent on
set t_Co=256
set t_ut=
colorscheme Tomorrow-Night
set title

"always redraw statusline
set laststatus=2

"search stuff
set ignorecase
set smartcase
set incsearch

"path stuff
set autochdir

"very magic regexes
nnoremap / /\v
vnoremap / /\v

set splitright
set cursorline
set ruler
set showcmd
set hidden
set nowrap
set scrolloff=2

set wildmenu
set wildmode=longest,list
set wildignore=*.swp,*.pyc

set number

set mouse=a

set guioptions-=m
set guioptions-=T

set pastetoggle=<F2>

imap jk <Esc>

let mapleader = ","
nnoremap <leader><space> :noh<cr>
nnoremap <leader>l :set invrelativenumber<cr>
