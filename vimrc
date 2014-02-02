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
set nonumber

" Wild menu
set wildmenu

" Status line
"" show the status line with more than one window
set laststatus=1

" Don't annoy me with swap files
set directory=$HOME/.vim/swapfiles

" Miscellaneous
set nohidden
set shortmess=aI
set visualbell

" The command window
set cmdheight=1

" Don't highlight anything
set colorcolumn=

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

" Configuration

"" reload
nnoremap <leader>cr :source ~/.vimrc<CR>
"
"" spelling
nnoremap <silent> <leader>cst :setlocal spell!<CR>
nnoremap <silent> <leader>cse :setlocal spelllang=en<CR>
nnoremap <silent> <leader>csp :setlocal spelllang=pl<CR>


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

"" make opening and closing windows easier
nnoremap <C-c> :close<CR>
nnoremap <C-o> <C-w>o

"" replacing
nnoremap <leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

"" split windows in a smart way
function! SplitBrain()
    if winwidth(0) > 4 * winheight(0)
        execute 'vertical new +setfiletype\ ' . &filetype
    else
        execute 'new +setfiletype\ ' . &filetype
    endif
endfunction

nnoremap <C-n> :call SplitBrain()<CR>

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
