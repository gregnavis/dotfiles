" goodbye vi
set nocompatible

" use UTF-8 everywhere
set encoding=utf8
set fileencoding=utf8

" required by vundle; will be turned on later
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
source ~/.vim/bundles.vim

" required by vundle; vundle is now configured
filetype plugin indent on

" don't unload abandoned buffers
set hidden

" abbreviate messages; don't show the intro message
set shortmess=aI

" don't insert tabs; indent using 4 spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" show line numbers
set number

" use wildmenu
set wildmenu

" always show status line
set laststatus=2

" detect file types and run appriopriate scripts
filetype on
filetype plugin on

" highlight syntax (solarized in GUI, default in terminal)
syntax on

if has('gui_running')
    colorscheme solarized
else
    colorscheme default
endif

" keyboard mappings

let mapleader = ","

" NERDtree
nmap <leader>n :NERDTree<CR>

" writing
nmap <leader>ww :write<CR>
nmap <leader>wa :wall<CR>

" tools
nmap <leader>m :make<CR>

if has('gui_running')
    nmap <leader>x :silent :!xterm >& /dev/null &<CR>
endif
