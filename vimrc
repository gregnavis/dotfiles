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

" Don't annoy me with swap files
set directory=$HOME/.vim/swapfiles

" Miscellaneous
set hidden
set shortmess=aI
set visualbell

" The command window
set cmdheight=1

" Highlight important columns
set colorcolumn=81,121

" detect file types and run appriopriate scripts
filetype on
filetype plugin on

" Syntax highlight
syntax on
if has('gui_running')
    colorscheme base16-default
else
    colorscheme default
endif

" Mappings
let mapleader = ","

"" make j and k use logical lines
nnoremap j gj
nnoremap k gk

"" spelling
nnoremap <silent> <leader>ss :setlocal spell!<CR>
nnoremap <silent> <leader>se :setlocal spelllang=en<CR>
nnoremap <silent> <leader>sp :setlocal spelllang=pl<CR>

"" toggling background color
function! ToggleBackground()
    if &background == "light"
        set background=dark
    else
        set background=light
    endif
endfunction

nnoremap <silent> <leader>cb :call ToggleBackground()<CR>

"" switch : and ; in the normal and visual mode
nnoremap ; :
vnoremap ; :

"" make window navigation easier
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l

"" Fugitive mappings
nnoremap <C-g>s :Gstatus<CR>
nnoremap <C-g>d :Gdiff<CR>

"" <leader>/ toggles search highlight
nnoremap <silent> <leader>/ :set hlsearch!<CR>

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
let g:ctrlp_map = '<leader>p'
nnoremap <leader>P :CtrlPBuffer<CR>

" Ag
nnoremap <leader>a :Ag<SPACE>

" make
nnoremap <leader>m :make<SPACE>
nnoremap <leader>M :make<CR>

" QuickRun
nnoremap <silent> <leader>q :QuickRun<CR>

" Syntastic
let g:syntastic_python_checkers = ['pep8', 'pylint']
let g:syntastic_auto_loc_list=0
let g:syntastic_mode_map = {
\   'mode': 'passive',
\   'active_filetypes': [],
\   'passive_filetypes': []
\}

nnoremap <leader>l :SyntasticCheck<CR>

" Tags
nnoremap <leader>t :tag<SPACE>

" Shell
if has('gui_running')
    nnoremap <leader>x :silent :!x-terminal-emulator >& /dev/null &<CR>
else
    nnoremap <leader>x :shell<CR>
endif
