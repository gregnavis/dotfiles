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
set smarttab

" be smart about case when searching; search incrementally
set smartcase
set incsearch

" show line numbers
set number

" don't wrap long lines
set nowrap

" use wildmenu
set wildmenu

" always show status line
set laststatus=2

" don't beep!
set visualbell

" detect file types and run appriopriate scripts
filetype on
filetype plugin on

" highlight syntax (solarized in GUI, default in terminal)
syntax on

if has('gui_running')
    colorscheme Tomorrow
else
    colorscheme default
endif

" chdir automatically when navigating the NERDTree
let g:NERDTreeChDirMode=2

" show NERDTree bookmarks
let g:NERDTreeShowBookmarks=1

" set a leader
let mapleader = ","

" map ; to : in normal and visual mode
nnoremap ; :
vnoremap ; :

" NERDtree
nmap <leader>n :NERDTree<CR>

" CtrlP shows files relative to the current working directory
let g:ctrlp_working_path_mode=0

" Ignore cruft intr CtrlP and NERDTree
let g:ctrlp_custom_ignore = {
\   'dir': '\v[\/](\.git|\.hg|\.svn|bin|lib|man)$',
\   'file': '\v\.(exe|so|dll|pyc|o)$',
\}
let NERDTreeIgnore = [
\   '\.exe$',
\   '\.so$',
\   '\.dll$',
\   '\.pyc$',
\   '\.o$',
\   'bin[[dir]]',
\   'lib[[dir]]',
\   'man[[dir]]',
\   'share[[dir]]'
\]

" Ack mappings
nmap <leader>a :Ack<SPACE>

" CtrlP mappings
let g:ctrlp_map = '<leader>t'
nmap <leader>b :CtrlPBuffer<CR>

" make
nmap <leader>m :make<SPACE>

" Syntastic mappings
nmap <leader>s :SyntasticCheck<CR>

" Syntastic syntax checkers
let g:syntastic_python_checker = 'pylint'

" shell
if has('gui_running')
    nmap <leader>x :silent :!urxvtc >& /dev/null &<CR>
else
    nmap <leader>x :shell<CR>
endif

" set the hostname
let g:hostname = substitute(system('hostname'), '\n\|\r', '', '')
