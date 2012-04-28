" font sizes to use in different environments
let s:font_size = {"default": 14, "netbook": 10, "redsky": 12}

" use console instead of popups and set an icon
set guioptions=ci

" set the font
let &guifont="Terminus " . get(s:font_size, $ENVIRONMENT, s:font_size["default"])
