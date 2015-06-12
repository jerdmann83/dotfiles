set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'sjl/badwolf'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
call vundle#end()
filetype plugin indent on

set nobackup
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround

let g:ctrlp_by_filename = 1
let g:ctrlp_working_path=0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

let g:ag_prg="ag --column --nogroup --noheading --nobreak"

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

syntax on
set t_Co=256
set t_ut=
set title
set ttyfast
set lazyredraw

" Apply nice colorscheme just to my local machines.
call system("test -f /etc/debian_version")
if v:shell_error == 0
    colors badwolf
    set cursorline
endif

set ignorecase
set smartcase
set incsearch

set splitright
set ruler
set showcmd
set hidden
set scrolloff=2

set wildmenu
set wildmode=list:longest,full
set wildignore=*.swp,*.pyc

set guioptions-=m
set guioptions-=T

set pastetoggle=<F2>
imap kj <Esc>

autocmd BufWritePre * :%s/\s\+$//e

let mapleader = ","
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
