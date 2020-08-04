" deoplete{{{
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#enable_smart_case = 1
	let g:deoplete#enable_refresh_always = 1

	inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<tab>"
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	inoremap <expr><BS> deoplete#smart_close_popup()."\<bs>"
	inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

	if 0
		let g:deoplete#sources = {}
		let g:deoplete#sources._ = ['buffer', 'dictionary']
		" let g:deoplete#sources.python = ['jedi']
	endif

	set shortmess+=c
	let g:echodoc#enable_at_startup = 1

	if exists('g:python_host_prog')
		let g:deoplete#sources#jedi#python_path = g:python_host_prog
	endif

	let g:deoplete#sources#jedi#enable_cache = 1
"}}}
" ultisnips {{{
    let g:UltiSnipsEditSplit           = "vertical"
    let g:UltiSnipsExpandTrigger       = "<tab>"
    let g:UltiSnipsJumpForwardTrigger  = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsSnippetDirectories  = ['ultisnips','ultisnips.private']
    " let g:UltiSnipsSnippetsDir = '~/Cystem/c-vim/ultisnips'
    let g:UltiSnipsSnippetsDir = '~/Cystem/c-vim/ultisnips.private'
    " 定义存放代码片段的文件夹 .vim/ultisnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
    " 进入对应filetype的snippets进行编辑
    map <leader>us :UltiSnipsEdit<CR>
" }}}
