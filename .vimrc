set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on

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
nnoremap <leader>n :bnext<cr>
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap gn :bn<cr>
nnoremap gp :bp<cr>
nnoremap gd :bd<cr>  
