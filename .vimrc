set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'msanders/snipmate.vim'
call vundle#end()
filetype plugin indent on

let g:syntastic_python_checkers = ['pyflakes']

set history=1000
set noswapfile
set clipboard=unnamed
set go+=a
set shortmess=atI
set autoread

"appearance stuff
syntax on
filetype plugin indent on
set t_Co=256
set t_ut=
colorscheme badwolf
set title
"always redraw statusline
set laststatus=2

"search stuff
set ignorecase
set smartcase
set incsearch
set hlsearch

"path stuff
set autochdir

"who has time to hold shift
nnoremap ; :

set splitright
set cursorline
set ruler
set showcmd
set hidden
set scrolloff=2

set wildmenu
set wildmode=longest,list
set wildignore=*.swp,*.pyc

set number

set mouse=a

" easier jump to exact mark position
nnoremap ' `
nnoremap ` '

set guioptions-=m
set guioptions-=T

set pastetoggle=<F2>
map <F3> :NERDTreeToggle<CR>
imap jk <Esc>

" bash-like commandline keys
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

let mapleader = ","
nnoremap <leader>l :set invrelativenumber<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader><space> :noh<cr>

nnoremap gj :bn<CR>
nnoremap gk :bp<CR>
nnoremap gd :bd<CR>

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

nnoremap Q <nop>
