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
    let g:bundle_groups=['python', 'javascript', 'markdown', 'web', 'json', 'nginx']
endif

" 非兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
filetype off " required! turn off

if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.vim/plugged')

" UI设置
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
" 主题 solarized
Plug 'altercation/vim-colors-solarized'
" airline
" 状态栏增强展示
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 语法显示增强
" 括号
Plug 'junegunn/rainbow_parentheses.vim'
" lint
Plug 'w0rp/ale'

" 代码补全

" 自动补全单引号，双引号等
Plug 'Raimondi/delimitMate'

" 自动补全
Plug 'Shougo/vimproc.vim', {'build' : 'make'}
" Add or remove your plugins here:
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" 快速注释
Plug 'scrooloose/nerdcommenter'

" 快速加入修改环绕字符
" for repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" easyalign
" 快速赋值语句对齐
Plug 'junegunn/vim-easy-align'

" quick movement
" easymotion
" 更高效的移动 [,, + w/fx/h/j/k/l]
Plug 'Lokaltog/vim-easymotion'

" 更高效的行内移动, f/F/t/T, 才触发
" quickscope
Plug 'unblevable/quick-scope'

Plug 'vim-scripts/matchit.zip'
" signature
" 显示marks - 方便自己进行标记和跳转
" m[a-zA-Z] add mark
" '[a-zA-Z] go to mark
" m<Space>  del all marks
" m/        list all marks
Plug 'kshenoy/vim-signature'

" quick selection and edit
" expandregion
" 选中区块
Plug 'terryma/vim-expand-region'
" 多光标选中编辑
" multiplecursors
Plug 'terryma/vim-multiple-cursors'

" quick locate file or function
" 文件搜索
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ctrlsf
" 类似sublimetext的搜索
" In CtrlSF window:
" 回车/o, 打开
" t       在tab中打开(建议)
" T - Lkie t but focus CtrlSF window instead of opened new tab.
" q - Quit CtrlSF window.
Plug 'dyng/ctrlsf.vim'
" incsearch
" Plug 'haya14busa/incsearch.vim'
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" quickrun
Plug 'thinca/vim-quickrun'

" git fugitive
Plug 'tpope/vim-fugitive'
" gitgutter
Plug 'airblade/vim-gitgutter'

" nav
" Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'

" tagbar
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'jsfaint/gen_tags.vim'


" text object
" 支持自定义文本对象
Plug 'kana/vim-textobj-user'
" 增加行文本对象: l   dal yal cil
Plug 'kana/vim-textobj-line'
" 增加文件文本对象: e   dae yae cie
Plug 'kana/vim-textobj-entire'
" 增加缩进文本对象: i   dai yai cii - 相同缩进属于同一块
Plug 'kana/vim-textobj-indent'

" deoplete{{{
	if has('nvim')
		Plug 'Shougo/deoplete.nvim'
	else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif

	" Plug 'zchee/deoplete-clang'
	Plug 'zchee/deoplete-jedi'

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
		" let g:deoplete#sources.cpp = ['clang']
		let g:deoplete#sources.python = ['jedi']
		let g:deoplete#sources.cpp = ['omni']
	endif

	set shortmess+=c
	let g:echodoc#enable_at_startup = 1

	if exists('g:python_host_prog')
		let g:deoplete#sources#jedi#python_path = g:python_host_prog
	endif

	let g:deoplete#sources#jedi#enable_cache = 1
"}}}
if count(g:bundle_groups, 'markdown')
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'Rykka/riv.vim',{ 'for': 'rst' }
    " 禁掉,否则Ultisnip没法用
    let g:riv_ignored_imaps = "<Tab>,<S-Tab>"

    let g:vim_markdown_toc_autofit = 1
    let g:table_mode_corner_corner='+'
    let g:table_mode_header_fillchar='='
endif

if count(g:bundle_groups, 'python')
    " for python.vim syntax highlight

    " Plug 'davidhalter/jedi-vim',{"autoload": { "filetypes": [ "python", "python3"] }})
    " Plug 'hdima/python-syntax')
    " Plug 'Glench/Vim-Jinja2-Syntax')
    Plug 'vim-python/python-syntax', { 'for': ['python'] }

    " pip install isort
    Plug 'fisadev/vim-isort'
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
    Plug 'pangloss/vim-javascript'
    Plug 'posva/vim-vue'
    autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
    autocmd FileType vue syntax sync fromstart

    " Plug 'leafgarland/typescript-vim'
    Plug 'Quramy/tsuquyomi'
    let g:tsuquyomi_use_vimproc = 1
    let g:javascript_plugin_flow = 1

    Plug 'prettier/vim-prettier', {'do': 'yarn install','for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'vue'] }
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
    let g:prettier#config#parser = 'babylon'
    " cli-override|file-override|prefer-file
    let g:prettier#config#config_precedence = 'prefer-file'

    let g:prettier#autoformat = 0
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync
endif

if count(g:bundle_groups, 'json')
    " json
    Plug 'elzr/vim-json'
endif

if count(g:bundle_groups, 'go')
    Plug 'fatih/vim-go'
endif

if count(g:bundle_groups, 'web')
    Plug 'mattn/emmet-vim'
endif

if count(g:bundle_groups, 'nginx')
endif

" Required:
filetype plugin indent on
syntax enable

" ################### 基础 ######################

" ale {{{
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_text_changed = 0
    "let g:ale_linters = {
    "   'javascript': ['eslint'],
    "}
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

" denite {{{
" call denite#custom#var('grep', 'command', ['ag'])
""}}}

" ultisnips {{{
    let g:UltiSnipsEditSplit           = "vertical"
    let g:UltiSnipsExpandTrigger       = "<tab>"
    let g:UltiSnipsJumpForwardTrigger  = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsSnippetDirectories  = ['ultisnips']
    let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'
    " 定义存放代码片段的文件夹 .vim/ultisnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
    " 进入对应filetype的snippets进行编辑
    map <leader>us :UltiSnipsEdit<CR>
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

" vim-gutentags {{{
    let $GTAGSLABEL = 'native-pygments'
    let $GTAGSCONF = '~/.gtags.conf'
        " gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'

    " 同时开启 ctags 和 gtags 支持：
    let g:gutentags_modules = []
    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif
    if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
    endif

    " 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let g:gutentags_cache_dir = expand('~/.cache/tags')

    " 配置 ctags 的参数
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['']
    let g:gutentags_ctags_extra_args += ['']

    " 如果使用 universal ctags 需要增加下面一行
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

    " 禁用 gutentags 自动加载 gtags 数据库的行为
    let g:gutentags_auto_add_gtags_cscope = 0
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
    " Extend the global default
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

" LeaderF {{{
    let g:Lf_ShortcutF = '<c-p>'
    let g:Lf_ShortcutB = '<m-n>'
    noremap <c-n> :LeaderfMru<cr>
    noremap <m-p> :LeaderfFunction!<cr>
    noremap ˜ :LeaderfBuffer<cr>
    noremap µ :LeaderfTag<cr>
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    let g:Lf_WorkingDirectoryMode = 'Ac'
    let g:Lf_WindowHeight = 0.30
    let g:Lf_CacheDirectory = expand('~/.cache/lf')
    let g:Lf_ShowRelativePath = 0
    let g:Lf_HideHelp = 1
    let g:Lf_StlColorscheme = 'powerline'
    let g:Lf_PreviewResult = {'Function':0}

    let g:Lf_NormalMap = {
        \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
        \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
        \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
        \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
        \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
        \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
        \ }
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
    let g:gitgutter_enabled = 1
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


" ################### 显示增强-主题 ###################"

" solarized {{{
    let g:solarized_menu=0
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    " let g:solarized_termcolors=256
" }}}

" ################### 快速导航 ###################

" nerdtree nerdtreetabs {{{
    Plug 'scrooloose/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	let g:NERDTreeMinimalUI = 1
	let g:NERDTreeDirArrows = 1
	let g:NERDTreeHijackNetrw = 0
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
	" let g:NERDTreeFileExtensionHighlightFullName = 1
	" let g:NERDTreeExactMatchHighlightFullName = 1
	" let g:NERDTreePatternMatchHighlightFullName = 1
	noremap <space>tn :NERDTree<cr>
	noremap <space>to :NERDTreeFocus<cr>
	noremap <space>tm :NERDTreeMirror<cr>
	noremap <space>tt :NERDTreeToggle<cr>
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
call plug#end()

" starify {{{
	noremap <space>ht :Startify<cr>
	noremap <space>hy :tabnew<cr>:Startify<cr>
" }}}

" starify {{{
" }}}
