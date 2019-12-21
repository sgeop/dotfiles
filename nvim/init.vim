call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'flazz/vim-colorschemes'
Plug 'rking/ag.vim',
Plug 'bling/vim-airline',

call plug#end()

let mapleader = " "

nmap <Leader>pt :NERDTreeToggle<CR>

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set clipboard=unnamed

set noswapfile

colorscheme molokai

filetype plugin on
