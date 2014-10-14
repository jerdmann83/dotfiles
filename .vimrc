set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/BufClose.vim'
Plugin 'msanders/snipmate.vim'
call vundle#end()
filetype plugin indent on

let g:syntastic_python_checkers = ['pyflakes']

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

map <F3> :NERDTreeToggle<CR>
imap jk <Esc>

let mapleader = ","
nnoremap <leader>l :set invrelativenumber<cr>
nnoremap <leader>n :bnext<cr>
nnoremap <leader>w :w<cr>

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

nnoremap J }
nnoremap K {
vnoremap J }
vnoremap K {
nnoremap gn :bn<cr>
nnoremap gp :bp<cr>
nnoremap <silent> gd :BufClose<cr>  
nnoremap Q <nop>
