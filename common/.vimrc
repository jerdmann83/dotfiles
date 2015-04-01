set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
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

let g:ctrlp_working_path=0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_enable_perl_checker = 1
let g:syntastic_cursor_column = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_mri_args = '-T1 -c'

set history=1000
set clipboard=unnamed
set go+=a
set shortmess=atI
set autoread

"not automatically triming trailing whitespace on write
"autocmd BufWritePre * :%s/\s\+$//e

"appearance stuff
syntax on
colors badwolf
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
imap kj <Esc>

let mapleader = ","
nnoremap <leader>b :BlogSave publish<cr>
nnoremap <leader>l :set invrelativenumber<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader><space> :noh<cr>

nnoremap gl :b#<CR>
nnoremap Q <nop>
nnoremap Y y$

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

nnoremap ; :
vnoremap ; :
