" fonts to use in different environments
let s:fonts = {
\   "black": "DejaVu Sans Mono 22",
\   "white": "DejaVu Sans Mono 12",
\   "redsky": "DejaVu Sans Mono 22"
\}

" use console instead of popups and set an icon
set guioptions=ci

" set the font
let &guifont=get(s:fonts, g:hostname, "")
