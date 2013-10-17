" Welcome in Vim!
set nocompatible

" Encoding
set encoding=utf8
set fileencoding=utf8

" Vundle
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
source ~/.vim/bundles.vim
filetype plugin indent on

" Indentation
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab
set tabstop=4

" Searching
set incsearch
set smartcase
set hlsearch
set nowrapscan

" Viewing
set nowrap
set number

" Wild menu
set wildmenu

" Status line
"" always show the status line
set laststatus=2

" Miscellaneous
set hidden
set shortmess=aI
set visualbell

" detect file types and run appriopriate scripts
filetype on
filetype plugin on

" Syntax highlight
syntax on
if has('gui_running')
    colorscheme fruity
else
    colorscheme default
endif

" Mappings
let mapleader = ","
"" switch : and ; in the normal and visual mode
nnoremap ; :
vnoremap ; :

" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeShowBookmarks=1
let NERDTreeIgnore = [
\   '\.exe$',
\   '\.so$',
\   '\.dll$',
\   '\.pyc$',
\   '\.o$'
\]
nnoremap <leader>n :NERDTree<CR>

" CtrlP
"" show files relative to the cwd
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore = {
\   'dir': '\v[\/](\.git|\.hg|\.svn|bin|lib|man)$',
\   'file': '\v\.(exe|so|dll|pyc|o)$',
\}
let g:ctrlp_map = '<leader>t'
nnoremap <leader>b :CtrlPBuffer<CR>

" ACK
nnoremap <leader>a :Ack<SPACE>

" make
nnoremap <leader>m :make<SPACE>

" Syntastic
let g:syntastic_python_checkers = ['pep8', 'pylint']
let g:syntastic_auto_loc_list=0
let g:syntastic_mode_map = {
\   'mode': 'passive',
\   'active_filetypes': [],
\   'passive_filetypes': []
\}

nnoremap <leader>s :SyntasticCheck<CR>

" Shell
if has('gui_running')
    nnoremap <leader>x :silent :!urxvtc >& /dev/null &<CR>
else
    nnoremap <leader>x :shell<CR>
endif
