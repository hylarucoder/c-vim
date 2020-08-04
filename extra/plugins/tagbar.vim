" tagbar {{{
    let g:tagbar_autofocus = 1
    let g:tagbar_autoshowtag = 1
    " let g:tagbar_show_visibility = 1
    let g:tagbar_type_ansible = {
        \ 'ctagstype' : 'ansible',
        \ 'kinds' : [
            \ 't:tasks'
        \ ],
        \ 'sort' : 0
    \ }
    let g:tagbar_type_make = {
        \ 'kinds':[
            \ 'm:macros',
            \ 't:targets'
        \ ]
    \}
    " for ruby
    let g:tagbar_type_ruby = {
        \ 'kinds' : [
            \ 'm:modules',
            \ 'c:classes',
            \ 'd:describes',
            \ 'C:contexts',
            \ 'f:methods',
            \ 'F:singleton methods'
        \ ]
    \ }
    let g:tagbar_type_typescript = {
    \ 'ctagsbin' : 'tstags',
    \ 'ctagsargs' : '-f-',
    \ 'kinds': [
        \ 'e:enums:0:1',
        \ 'f:function:0:1',
        \ 't:typealias:0:1',
        \ 'M:Module:0:1',
        \ 'I:import:0:1',
        \ 'i:interface:0:1',
        \ 'C:class:0:1',
        \ 'm:method:0:1',
        \ 'p:property:0:1',
        \ 'v:variable:0:1',
        \ 'c:const:0:1',
    \ ],
    \ 'sort' : 0
    \ }
    let g:tagbar_type_snippets = {
        \ 'ctagstype' : 'snippets',
        \ 'kinds' : [
            \ 's:snippets',
        \ ]
    \ }
    let g:tagbar_type_rst = {
        \ 'ctagstype': 'rst',
        \ 'ctagsbin' : $HOME.'/Cystem/c-vim/scripts/rst2ctags.py',
        \ 'ctagsargs' : '-f - --sort=yes',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
    \ }
    let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
        \ 'ctagsbin' : $HOME.'/Cystem/c-vim/scripts/markdown2ctags.py',
        \ 'ctagsargs' : '-f - --sort=yes',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
    \ }
" }}}

