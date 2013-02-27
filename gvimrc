" fonts to use in different environments
let s:fonts = {
\   "black": "Inconsolata Medium 15",
\   "white": "Inconsolata Medium 13",
\   "redsky": "Inconsolata Medium 22"
\}

" use console instead of popups and set an icon
set guioptions=ci

" set the font
let &guifont=get(s:fonts, g:hostname, "")
