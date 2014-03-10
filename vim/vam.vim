fun! EnsureVamIsOnDisk(plugin_root_dir)
    let vam_autoload_dir = a:plugin_root_dir.'/vim-addon-manager/autoload'
    if isdirectory(vam_autoload_dir)
        return 1
    else
        if 1 == confirm("Clone VAM into ".a:plugin_root_dir."?","&Y\n&N")
            " I'm sorry having to add this reminder. Eventually it'll pay off.
            call confirm("Remind yourself that most plugins ship with ".
                        \"documentation (README*, doc/*.txt). It is your ".
                        \"first source of knowledge. If you can't find ".
                        \"the info you're looking for in reasonable ".
                        \"time ask maintainers to improve documentation")
            call mkdir(a:plugin_root_dir, 'p')
            execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.
                        \       shellescape(a:plugin_root_dir, 1).'/vim-addon-manager'
            exec 'helptags '.fnameescape(a:plugin_root_dir.'/vim-addon-manager/doc')
        endif
        return isdirectory(vam_autoload_dir)
    endif
endfun

fun! SetupVAM()
    let g:vim_addon_manager = {}
    let g:vim_addon_manager.log_to_buf = 1
    let c = get(g:, 'vim_addon_manager', {})
    let g:vim_addon_manager = c
    let c.plugin_root_dir = expand('$HOME/.vim/vim-addons', 1)
    if !EnsureVamIsOnDisk(c.plugin_root_dir)
        echohl ErrorMsg | echomsg "No VAM found!" | echohl NONE
        return
    endif
    let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'

    call vam#ActivateAddons(['github:chriskempson/base16-vim',
                            \'delimitMate',
                            \'ctrlp',
                            \'UltiSnips',
                            \'quickrun%3146',
                            \'Syntastic',
                            \'ag',
                            \'jedi-vim',
                            \'github:tpope/vim-haml',
                            \'github:itchyny/lightline.vim',
                            \'vim-sneak',
                            \'vim-autopep8',
                            \'github:hynek/vim-python-pep8-indent',
                            \'virtualenv',
                            \'Markdown_syntax',
                            \'endwise',
                            \'commentary',
                            \'Emmet'], {'auto_install' : 1})
endfun
call SetupVAM()
au GUIEnter * call SetupVAM()
