set nocompatible
execute pathogen#infect()

"appearance stuff
syntax on
filetype plugin indent on
set t_Co=256
"disable background color erase
set t_ut=
colorscheme jellybeans
set title

"always redraw statusline
set laststatus=2

"search stuff
set ignorecase
set smartcase
set incsearch

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

set number

set mouse=a

set guioptions-=m
set guioptions-=T

set pastetoggle=<F2>

imap jk <Esc>

let mapleader = ","
nnoremap <leader><space> :noh<cr>
nnoremap <leader>l :set invrelativenumber<cr>
nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprev<cr>

nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>
