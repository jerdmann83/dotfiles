set nocompatible
execute pathogen#infect()

"appearance stuff
syntax on
filetype plugin indent on
set t_Co=256
colorscheme badwolf
set title

"always redraw statusline
set laststatus=2

"search stuff
set ignorecase
set smartcase
set incsearch

"easier regex handling in searches
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

let mapleader = ","
nnoremap <leader><space> :noh<cr>
nnoremap <leader>l :set invrelativenumber<cr>
nnoremap <leader>n :bnext<cr>
nnoremap <leader>p :bprev<cr>
