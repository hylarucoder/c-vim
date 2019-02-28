" ==========================================
" bundle 插件管理和配置项
" ==========================================

if !exists('g:bundle_groups')
    let g:bundle_groups=['python', 'rust', 'go', 'javascript', 'writing', 'web', 'json', 'misc']
endif

filetype off " required! turn off

if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.plugged')

"====================
"   UI设置 
"====================

" 主题 solarized
Plug 'altercation/vim-colors-solarized'
" 状态栏增强展示
Plug 'itchyny/lightline.vim'
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"====================
"   移动跳转
"====================
" 移动增强
Plug 'rhysd/accelerated-jk'
Plug 'justinmk/vim-sneak'
" 更高效的移动 [,, + w/fx/h/j/k/l]
Plug 'Lokaltog/vim-easymotion'
" 跳转增强
Plug 'tpope/vim-projectionist'
Plug 'vim-scripts/matchit.zip'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

Plug 'kshenoy/vim-signature'
" m[a-zA-Z] add mark
" '[a-zA-Z] go to mark
" m<Space>  del all marks
" m/        list all marks

Plug 'ybian/smartim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'dyng/ctrlsf.vim'

" fzf{{{
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)
" }}}


"====================
"   输入增强
"====================

Plug 'Raimondi/delimitMate'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimproc.vim', {'build' : 'make'}

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-jedi'

Plug 'carlitux/deoplete-ternjs'

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0


Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'


"====================
"   修改增强
"====================

Plug 'brooth/far.vim'
Plug 'scrooloose/nerdcommenter'
" 快速加入修改环绕字符
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'

"====================
"   选区增强
"====================

Plug 'terryma/vim-expand-region'

"====================
"   GIT 相关
"====================

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git' ,{ 'for': ['gitcommit', 'gitrebase', 'gitconfig'] }
Plug 'airblade/vim-gitgutter'


"====================
"  文本对象
"====================
" 支持自定义文本对象
Plug 'kana/vim-textobj-user'
" 增加行文本对象: l   dal yal cil
Plug 'kana/vim-textobj-line'
" 增加文件文本对象: e   dae yae cie
Plug 'kana/vim-textobj-entire'
" 增加缩进文本对象: i   dai yai cii - 相同缩进属于同一块
Plug 'kana/vim-textobj-indent'

"====================
"  未分类
"====================
Plug 'kristijanhusak/vim-carbon-now-sh'
vnoremap <F5> :CarbonNowSh<CR>

if count(g:bundle_groups, 'writing')
    Plug 'Rykka/riv.vim',{ 'for': 'rst' }
    let g:riv_ignored_imaps = "<Tab>,<S-Tab>"
    Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    " 禁掉,否则Ultisnip没法用

    let g:vim_markdown_toc_autofit = 1
    let g:table_mode_corner_corner='+'
    let g:table_mode_header_fillchar='='
endif

if count(g:bundle_groups, 'python')
    " for python.vim syntax highlight
    Plug 'python-mode/python-mode', { 'branch': 'develop' }
    Plug 'ambv/black'
    let g:black_virtualenv = "~/.config/black"
    Plug 'tshirtman/vim-cython'
    let g:pymode = 1
    let g:pymode_python = 'python3'
    let g:pymode_rope = 1
    let g:pymode_lint = 0
endif

if count(g:bundle_groups, 'javascript')
    " javascript
    Plug 'pangloss/vim-javascript'
    Plug 'posva/vim-vue'
    let g:vue_disable_pre_processors=1

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
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
endif

if count(g:bundle_groups, 'rust')
    Plug 'rust-lang/rust.vim'
endif

if count(g:bundle_groups, 'web')
    Plug 'mattn/emmet-vim'
    Plug 'cespare/vim-toml'
    Plug 'ksauzz/thrift.vim'
endif

if count(g:bundle_groups, 'misc')
    Plug 'cespare/vim-toml', { 'for':'toml'}
    Plug 'chrisbra/csv.vim', { 'for':'csv'}
    Plug 'ekalinin/Dockerfile.vim', { 'for':['Dockerfile', 'yaml.docker-compose']}
    Plug 'tmux-plugins/vim-tmux', { 'for':'tmux'}
    Plug 'andreshazard/vim-logreview', { 'for':'logreview'}
endif

" Required:
filetype plugin indent on
syntax enable

Plug 'w0rp/ale'

" delimitMate {{{
    " for python docstring ",优化输入
    au FileType python let b:delimitMate_nesting_quotes = ['"']
    au FileType php let delimitMate_matchpairs = "(:),[:],{:}"
    " 关闭某些类型文件的自动补全
    "au FileType mail let b:delimitMate_autoclose = 0
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
    hi link EasyMotionTarget WarningMsg
    hi link EasyMotionShade Comment
    let g:EasyMotion_do_mapping = 0
    " map f <Plug>(easymotion-f)
    " map F <Plug>(easymotion-F)
    " map b <Plug>(easymotion-b)
    " map B <Plug>(easymotion-B)
    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
    " 重复上一次操作, 类似repeat插件, 很强大
    map <Leader><leader>. <Plug>(easymotion-repeat)
" }}}

" expandregion {{{
    map + <Plug>(expand_region_expand)
    map - <Plug>(expand_region_shrink)
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


" vim-go {{{
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

" css {{{

" }}}

" json {{{
    let g:vim_json_syntax_conceal = 0
" }}}


" markdown {{{
    let g:smartim_default = 'com.apple.keylayout.ABC'
" }}}

" Other Language {{{
    Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
" }}}

call cvim#source_rc('plugins/all.vim')
call cvim#source_rc('plugins/deoplete.vim')
call cvim#source_rc('plugins/tagbar.vim')
call cvim#source_rc('plugins/gutentags.vim')
call cvim#source_rc('plugins/nerdtree.vim')
call cvim#source_rc('plugins/pangu.vim')
call cvim#source_rc('plugins/starify.vim')

call plug#end()
call cvim#source_rc('plugins/denite.vim')
