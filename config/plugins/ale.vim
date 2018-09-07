" ale {{{
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_text_changed = 0
    let g:ale_linters = {
    \   'javascript': ['eslint', 'tsserver'],
    \   'typescript': ['tsserver', 'tslint'],
    \   'html': []
    \}
    let g:ale_sign_error = '>>'
    let g:ale_sign_warning = '--'
    let g:airline#extensions#ale#enabled = 1
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    " Write this in your vimrc file
    let g:ale_lint_on_text_changed = 'never'
    " You can disable this option too
    " if you don't want linters to run on opening a file
    let g:ale_lint_on_enter = 0
    nmap <F2> <Plug>(ale_previous_wrap)
    nmap <F3> <Plug>(ale_next_wrap)
" }}}

