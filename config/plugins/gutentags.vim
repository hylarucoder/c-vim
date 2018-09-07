" vim-gutentags {{{
    let $GTAGSLABEL = 'native-pygments'
    let $GTAGSCONF = '~/.gtags.conf'

    " gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

    " enable gtags module
    let g:gutentags_modules = ['ctags']

    " generate datebases in my cache directory, prevent gtags files polluting my project
    let g:gutentags_cache_dir = expand('~/.cache/tags')

    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'

    " 同时开启 ctags 和 gtags 支持：
    let g:gutentags_modules = []
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif

    " 配置 ctags 的参数
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['']

    " 如果使用 universal ctags 需要增加下面一行
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
    let g:gutentags_debug = 1
    let g:gutentags_file_list_command = {
        \ 'markers': {
            \ '.git': 'git ls-files',
            \ '.hg': 'hg files',
            \ 'Pipfile': 'python -c \"import os, sys; print('' ''.join(''{}''.format(d) for d in sys.path if os.path.isdir(d)))\"',
        \ },
    \ }

" }}}
