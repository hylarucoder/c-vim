" ==========================================
" bundle 插件管理和配置项
" ==========================================

"------------------------------------------- begin of configs --------------------------------------------

" ################### 包依赖 #####################
" package dependence:  ctags, ag(he_silver_searcher)
" python dependence:   pep8, pyflake


" ################### 插件管理 ###################

" inspired by spf13, 自定义需要的插件集合
if !exists('g:bundle_groups')
    let g:bundle_groups=['python', 'javascript', 'markdown', 'web', 'json', 'go', 'nginx']
endif

" 非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
filetype off " required! turn off

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/dotfiles/c-vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state($HOME.'/dotfiles/c-vim/dein')
  call dein#begin($HOME.'/dotfiles/c-vim/dein')
  " Let dein manage dein
  " Required:
  call dein#add($HOME.'/dotfiles/c-vim/dein/repos/github.com/Shougo/dein.vim')

  " UI设置
  call dein#add('mhinz/vim-startify')
  call dein#add('Shougo/denite.nvim')



  " 自动补全
  call dein#add('Shougo/neocomplete')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')

  " 语法相关
  call dein#add('w0rp/ale')



  " 自动补全单引号，双引号等
  call dein#add('Raimondi/delimitMate')
  " 自动补全html/xml标签
  call dein#add('docunext/closetag.vim')

  " quick edit
  " 快速注释
  call dein#add('scrooloose/nerdcommenter')


  " 快速加入修改环绕字符
  " for repeat -> enhance surround.vim, . to repeat command
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  " trailingwhitespace
  " 快速去行尾空格 [, + <Space>]
  call dein#add('bronson/vim-trailing-whitespace')
  " easyalign
  " 快速赋值语句对齐
  call dein#add('junegunn/vim-easy-align')

  " quick movement
  " easymotion
  " 更高效的移动 [,, + w/fx/h/j/k/l]
  call dein#add('Lokaltog/vim-easymotion')

  " 更高效的行内移动, f/F/t/T, 才触发
  " quickscope
  call dein#add('unblevable/quick-scope')

  call dein#add('vim-scripts/matchit.zip')
  " signature
  " 显示marks - 方便自己进行标记和跳转
  " m[a-zA-Z] add mark
  " '[a-zA-Z] go to mark
  " m<Space>  del all marks
  " m/        list all marks
  call dein#add('kshenoy/vim-signature')

" quick selection and edit
" expandregion
" 选中区块
call dein#add('terryma/vim-expand-region')
" 多光标选中编辑
" multiplecursors
call dein#add('terryma/vim-multiple-cursors')

" quick locate file or function
" 文件搜索
" change to https://github.com/ctrlpvim/ctrlp.vim
" ctrlp ctrlpfunky
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('tacahiroy/ctrlp-funky')

" ctrlsf
" 类似sublimetext的搜索
" In CtrlSF window:
" 回车/o, 打开
" t       在tab中打开(建议)
" T - Lkie t but focus CtrlSF window instead of opened new tab.
" q - Quit CtrlSF window.
call dein#add('dyng/ctrlsf.vim')
" incsearch
" Plug 'haya14busa/incsearch.vim'
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" quickrun
call dein#add('thinca/vim-quickrun')

" git
" fugitive
call dein#add('tpope/vim-fugitive')
" gitgutter
call dein#add('airblade/vim-gitgutter')

" view
" airline
" 状态栏增强展示
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
" rainbow_parentheses
" 括号显示增强
call dein#add('kien/rainbow_parentheses.vim')
" 主题 solarized
" solarized
call dein#add('altercation/vim-colors-solarized')
" molokai
" 主题 molokai
call dein#add('tomasr/molokai')

" nav
" nerdtree nerdtreetabs
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('Xuyuanp/nerdtree-git-plugin')


" tagbar
call dein#add('majutsushi/tagbar')

" text object
" 支持自定义文本对象
call dein#add('kana/vim-textobj-user')
" 增加行文本对象: l   dal yal cil
call dein#add('kana/vim-textobj-line')
" 增加文件文本对象: e   dae yae cie
call dein#add('kana/vim-textobj-entire')
" 增加缩进文本对象: i   dai yai cii - 相同缩进属于同一块
call dein#add('kana/vim-textobj-indent')

if count(g:bundle_groups, 'markdown')
    call dein#add('godlygeek/tabular')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('Rykka/riv.vim',{ 'for': 'rst' })
    " 禁掉,否则Ultisnip没法用
    let g:riv_ignored_imaps = "<Tab>,<S-Tab>"

    let g:vim_markdown_toc_autofit = 1
    let g:table_mode_corner_corner='+'
    let g:table_mode_header_fillchar='='
endif

if count(g:bundle_groups, 'python')
    " for python.vim syntax highlight
    " pythonsyntax
    " call dein#add('python-mode/python-mode')
    call dein#add('davidhalter/jedi-vim',{"autoload": { "filetypes": [ "python", "python3"] }})
    " call dein#add('hdima/python-syntax')
    " call dein#add('Glench/Vim-Jinja2-Syntax')

    " pip install isort
    call dein#add('fisadev/vim-isort')
    " Shift-V 上下选中, ctrl + i 规范化
    let g:vim_isort_map = '<C-i>'
    " python code format all file
    autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
    " format select block
    " autocmd FileType python vnoremap <leader>y :!yapf<Cr>

    " Plug 'mindriot101/vim-yapf'
    " scriptencoding utf-8
    " let g:yapf_style = "google"
    " let g:yapf_style = "pep8"
    " setenv PYTHONIOENCODING UTF-8
    " nnoremap <leader>y :call Yapf()<cr>
endif

if count(g:bundle_groups, 'javascript')
    " javascript
    call dein#add('pangloss/vim-javascript')
    call dein#add('posva/vim-vue')

    call dein#add('leafgarland/typescript-vim')
    call dein#add('Quramy/tsuquyomi')
    let g:tsuquyomi_use_vimproc = 1

    let g:javascript_plugin_flow = 1

    call dein#add('prettier/vim-prettier', {'do': 'yarn install','for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] })
    let g:prettier#exec_cmd_async = 1
    " max line length that prettier will wrap on
    let g:prettier#config#print_width = 80
    " number of spaces per indentation level
    let g:prettier#config#tab_width = 2
    " use tabs over spaces
    let g:prettier#config#use_tabs = 'false'
    " print semicolons
    let g:prettier#config#semi = 'true'
    " single quotes over double quotes
    let g:prettier#config#single_quote = 'true'
    " print spaces between brackets
    let g:prettier#config#bracket_spacing = 'false'
    " put > on the last line instead of new line
    let g:prettier#config#jsx_bracket_same_line = 'true'
    " none|es5|all
    let g:prettier#config#trailing_comma = 'all'
    " flow|babylon|typescript|postcss|json|graphql
    let g:prettier#config#parser = 'flow'
    " cli-override|file-override|prefer-file
    let g:prettier#config#config_precedence = 'prefer-file'
endif

if count(g:bundle_groups, 'json')
    " json
    call dein#add('elzr/vim-json')
endif

if count(g:bundle_groups, 'go')
    call dein#add('fatih/vim-go')
endif

if count(g:bundle_groups, 'web')
    " ###### emmet HTML complete #########
    call dein#add('mattn/emmet-vim')
endif

if count(g:bundle_groups, 'nginx')
endif


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" ################### 基础 ######################

" ale {{{
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_text_changed = 0
    " let g:ale_linters = {
    " \   'javascript': ['eslint'],
    " \}
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
" }}}


" ################### 自动补全 ###################

" NeoComplete {{{
    "neocomplete 默认tab  s-tab 和自动补全冲突
    "Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 2

    " Define dictionary.
    " TODO 字典太大. 建议选一个小一点的字典
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ '_' : $HOME.'/dotfiles/c-vim/dict/programming.dict',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    let g:neosnippet#disable_runtime_snippets = {}
    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType python setlocal omnifunc=jedi#completions
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0
    let g:jedi#smart_auto_mappings = 0
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
    " alternative pattern: '\h\w*\|[^. \t]\.\w*'
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" }}}

" denite {{{
    call denite#custom#var('grep', 'command', ['ag'])
""}}}

" ultisnips {{{
    let g:UltiSnipsEditSplit           = "vertical"
    let g:UltiSnipsExpandTrigger       = "<tab>"
    let g:UltiSnipsJumpForwardTrigger  = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
    let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
    " 定义存放代码片段的文件夹 .vim/UltiSnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
    " 进入对应filetype的snippets进行编辑
    map <leader>us :UltiSnipsEdit<CR>

    " ctrl+j/k 进行选择
    function! g:JInNcpl()
        if pumvisible()
            return "\<C-n>"
        else
            return "\<c-j>"
        endif
    endfunction

    inoremap <c-j> <c-r>=g:JInNcpl()<cr>
    au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInNcpl()<cr>"
    let g:UltiSnipsJumpBackwordTrigger = "<c-k>"
" }}}


" delimitMate {{{
    " for python docstring ",优化输入
    au FileType python let b:delimitMate_nesting_quotes = ['"']
    au FileType php let delimitMate_matchpairs = "(:),[:],{:}"
    " 关闭某些类型文件的自动补全
    "au FileType mail let b:delimitMate_autoclose = 0
" }}}


" closetag {{{
    let g:closetag_html_style=1
" }}}

" ################### 快速编码 ###################

" nerdcommenter {{{
    let g:NERDSpaceDelims=1
    let g:NERDAltDelims_python = 1
" }}}

" trailingwhitespace {{{
    map <leader><space> :FixWhitespace<cr>
" }}}

" easyalign {{{
    vmap <Leader>a <Plug>(EasyAlign)
    nmap <Leader>a <Plug>(EasyAlign)
    if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
    endif
    let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
    " Default:
    " If a delimiter is in a highlight group whose name matches any of the followings, it will be ignored.
    let g:easy_align_ignore_groups = ['Comment', 'String']
" }}}

" ################### 快速移动 ###################

" easymotion {{{
    let g:EasyMotion_smartcase = 1
    "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
    " 重复上一次操作, 类似repeat插件, 很强大
    map <Leader><leader>. <Plug>(easymotion-repeat)
" }}}


" quickscope {{{
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    " macvim/gvim会有问题, 暂时注解
    " let g:qs_first_occurrence_highlight_color = '#afff5f' " gui vim
    " let g:qs_first_occurrence_highlight_color = 155       " terminal vim
    " let g:qs_second_occurrence_highlight_color = '#5fffff'  " gui vim
    " let g:qs_second_occurrence_highlight_color = 81         " terminal vim
" }}}

" ################### 快速选中 ###################

" expandregion {{{
    " map + <Plug>(expand_region_expand)
    " map _ <Plug>(expand_region_shrink)
    vmap v <Plug>(expand_region_expand)
    vmap V <Plug>(expand_region_shrink)
    " Extend the global default
    call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0
      \ })
" }}}

" multiplecursors {{{
    let g:multi_cursor_use_default_mapping=0
    " Default mapping
    let g:multi_cursor_next_key='<C-m>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
" }}}

" ################### 功能相关 ###################

" ctrlp ctrlpfunky{{{
    let g:ctrlp_map = '<leader>p'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|rvm|optimized|compiled|node_modules)$',
        \ 'file': '\v\.(DS_Store|exe|so|dll|zip|tar|tar.gz|pyc)$',
        \ }
    let g:ctrlp_working_path_mode=0
    let g:ctrlp_match_window_bottom=1
    let g:ctrlp_max_height=15
    let g:ctrlp_match_window_reversed=0
    let g:ctrlp_mruf_max=500
    let g:ctrlp_follow_symlinks=1
    " 如果安装了ag, 使用ag
    if executable('ag')
      " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
      " ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0
    endif
    map <leader>f :CtrlPMRU<CR>

    " ctrlpfunky
    " ctrlp插件1 - 不用ctag进行函数快速跳转
    nnoremap <Leader>fu :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
    nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    let g:ctrlp_funky_syntax_highlight = 1

    let g:ctrlp_extensions = ['funky']
" }}}


" ctrlsf {{{
    nmap \ <Plug>CtrlSFCwordPath<CR>
    " let g:ctrlsf_position = 'below'
    " let g:ctrlsf_winsize = '30%'
    let g:ctrlsf_auto_close = 0
    let g:ctrlsf_confirm_save = 0
    " Note: cannot use <CR> or <C-m> for open
    " Use : <sapce> or <tab>
    let g:ctrlsf_mapping = {
        \ "open"  : "<Space>",
        \ "openb" : "O",
        \ "tab"   : "t",
        \ "tabb"  : "T",
        \ "prevw" : "p",
        \ "quit"  : "q",
        \ "next"  : "<C-J>",
        \ "prev"  : "<C-K>",
        \ "pquit" : "q",
        \ }
" }}}

" git.  git操作还是习惯命令行,vim里面处理简单diff编辑操作

" fugitive {{{
    " :Gdiff  :Gstatus :Gvsplit
    nnoremap <leader>ge :Gdiff<CR>
    " not ready to open
    " <leader>gb maps to :Gblame<CR>
    " <leader>gs maps to :Gstatus<CR>
    " <leader>gd maps to :Gdiff<CR>  和现有冲突
    " <leader>gl maps to :Glog<CR>
    " <leader>gc maps to :Gcommit<CR>
    " <leader>gp maps to :Git push<CR>
" }}}

" gitgutter {{{
    " 同git diff,实时展示文件中修改的行
    " 只是不喜欢除了行号多一列, 默认关闭,gs时打开
    let g:gitgutter_map_keys = 0
    let g:gitgutter_enabled = 0
    let g:gitgutter_highlight_lines = 1
    nnoremap <leader>gs :GitGutterToggle<CR>
" }}}

" ################### 显示增强 ###################

" airline {{{
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_left_sep = '▶'
    let g:airline_left_alt_sep = '❯'
    let g:airline_right_sep = '◀'
    let g:airline_right_alt_sep = '❮'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    " 是否打开tabline
    " let g:airline#extensions#tabline#enabled = 1
" }}}



" rainbow_parentheses {{{
    " 不加入这行, 防止黑色括号出现, 很难识别
    " \ ['black',       'SeaGreen3'],
    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]

    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
" }}}


" ################### 显示增强-主题 ###################"

" solarized {{{
    let g:solarized_menu=0
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    " let g:solarized_termcolors=256
" }}}

" molokai {{{
    " monokai原始背景色
    let g:molokai_original = 1
    let g:rehash256 = 1
" }}}

" ################### 快速导航 ###################

" nerdtree nerdtreetabs {{{
    map <F3> :NERDTreeToggle<CR>
    map <leader>n :NERDTreeToggle<CR>
    let NERDTreeHighlightCursorline=1
    let NERDTreeShowHidden=1
    let NERDTreeIgnore=[ '\node_modules$', '\.DS_Store$', '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
    "close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
    " s/v 分屏打开文件
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'


    " nerdtreetabs
    map <Leader>n <plug>NERDTreeTabsToggle<CR>
    " 关闭同步
    " let g:nerdtree_tabs_synchronize_view=0
    " let g:nerdtree_tabs_synchronize_focus=0
    " 是否自动开启nerdtree
    " thank to @ListenerRi, see https://github.com/wklken/k-vim/issues/165
    " let g:nerdtree_tabs_open_on_console_startup=0
    " let g:nerdtree_tabs_open_on_gui_startup=0
    let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}


" Vim Workspace Controller
" ctrlspace {{{
    let g:airline_exclude_preview = 1
    hi CtrlSpaceSelected guifg=#586e75 guibg=#eee8d5 guisp=#839496 gui=reverse,bold ctermfg=10 ctermbg=7 cterm=reverse,bold
    hi CtrlSpaceNormal   guifg=#839496 guibg=#021B25 guisp=#839496 gui=NONE ctermfg=12 ctermbg=0 cterm=NONE
    hi CtrlSpaceSearch   guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold
    hi CtrlSpaceStatus   guifg=#839496 guibg=#002b36 gui=reverse term=reverse cterm=reverse ctermfg=12 ctermbg=8
" }}}


" 标签导航
" tagbar {{{
    let g:tagbar_autofocus = 1
    let g:tagbar_autoshowtag = 1
    " let g:tagbar_show_visibility = 1
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
        \ 'ctagsbin' : $HOME.'/dotfiles/c-vim/scripts/rst2ctags.py',
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
        \ 'ctagsbin' : $HOME.'/dotfiles/c-vim/scripts/markdown2ctags.py',
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


" ################### 语言相关 ###################

" quickrun {{{
    let g:quickrun_config = {
    \   "_" : {
    \       "outputter" : "message",
    \   },
    \}

    let g:quickrun_no_default_key_mappings = 1
    nmap <Leader>r <Plug>(quickrun)
    map <F10> :QuickRun<CR>
" }}}


" pythonsyntax {{{
    let python_highlight_all = 1
" }}}

" piv {{{
    let g:DisableAutoPHPFolding = 1
" }}}


" vimgo {{{
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1

    let g:go_fmt_fail_silently = 1
    " format with goimports instead of gofmt
    let g:go_fmt_command = "goimports"
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go', 'java'] }
" }}}

" markdown {{{
    let g:vim_markdown_folding_disabled=1
" }}}


" javascript {{{
    " pangloss/vim-javascript
    let g:html_indent_inctags = "html,body,head,tbody"
    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"
" }}}

" json {{{
    let g:vim_json_syntax_conceal = 0
" }}}

" css {{{
" }}}

" nginx {{{
" }}}


" ####### temp #######

" beta {{{
" }}}

"------------------------------------------- end of configs --------------------------------------------
"
