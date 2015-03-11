set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on

set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround

set nobackup
set noswapfile

let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_enable_perl_checker = 1

set history=1000
set clipboard=unnamed
set go+=a
set shortmess=atI
set autoread

"automatically trim trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

"appearance stuff
syntax on
colorscheme badwolf
set t_Co=256
set t_ut=
set title
set ttyfast
set lazyredraw
"always redraw statusline
set laststatus=2

set ignorecase
set smartcase
set incsearch
set hlsearch

set splitright
set cursorline
set ruler
set showcmd
set hidden
set scrolloff=2

set wildmenu
set wildmode=longest,list
set wildignore=*.swp,*.pyc

set mouse=a

" easier jump to exact mark position
nnoremap ' `
nnoremap ` '

set guioptions-=m
set guioptions-=T

set pastetoggle=<F2>
imap jf <Esc>

" bash-like commandline keys
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

let mapleader = ","
nnoremap <leader>b :BlogSave publish<cr>
nnoremap <leader>l :set invrelativenumber<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader><space> :noh<cr>

nnoremap gj :bn<CR>
nnoremap gk :bp<CR>

nnoremap Q <nop>

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

nnoremap ; :
vnoremap ; :
