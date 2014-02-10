" Refactoring
nnoremap <buffer> <leader>rr :RopeRename<CR>
nnoremap <buffer> <leader>rem :RopeExtractMethod<CR>

" autopep8
nnoremap <buffer> <leader>8 :call Autopep8()<CR>

" Sort imported symbols
nnoremap <leader>rs vi(:s/,\s*/\r/g<CR>vi(:s/^\s\+//<CR>vi(:g/^$/d<CR>vi(:sort<CR>vi(:s/$/,/<CR>vi(J$x
