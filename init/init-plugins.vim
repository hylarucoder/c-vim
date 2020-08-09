"======================================================================
"
" init-plugins.vim - 
"
" Created by skywind on 2018/05/31
" Last Modified: 2020-08-08 09:38:50
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :

"----------------------------------------------------------------------
" 默认情况下的分组，可以再前面覆盖之
"----------------------------------------------------------------------
if !exists('g:bundle_group')
	let g:bundle_group = ['general', 'filetypes', 'textobj']
	let g:bundle_group += ['Python', "Rust", "JavaScript", "Writing"]
endif

"----------------------------------------------------------------------
" 计算当前 vim-init 的子路径
"----------------------------------------------------------------------
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

function! s:path(path)
	let path = expand(s:home . '/' . a:path )
	return substitute(path, '\\', '/', 'g')
endfunc

"----------------------------------------------------------------------
" 在 ~/.vim/bundles 下安装插件
"----------------------------------------------------------------------
call plug#begin(get(g:, 'bundle_home', '~/.vim/bundles'))

"----------------------------------------------------------------------
" 默认插件
"----------------------------------------------------------------------

" 展示开始画面，显示最近编辑过的文件
Plug 'mhinz/vim-startify'

" 一次性安装一大堆 colorscheme
Plug 'flazz/vim-colorschemes'

Plug 'ybian/smartim'
let g:smartim_default = 'com.apple.keylayout.ABC'

" 表格对齐，使用命令 Tabularize
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'
" which key
Plug 'liuchengxu/vim-which-key'

Plug 'maralla/completor.vim'
Plug 'maralla/completor-neosnippet'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" ultisnips {{{
    let g:UltiSnipsEditSplit           = "vertical"
    let g:UltiSnipsExpandTrigger       = "<tab>"
    let g:UltiSnipsJumpForwardTrigger  = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    map <leader>us :UltiSnipsEdit<CR>
" }}}

"----------------------------------------------------------------------
" 基础插件
"----------------------------------------------------------------------


" 括号
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" 支持库，给其他插件用的函数库
Plug 'xolox/vim-misc'

" 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
Plug 'kshenoy/vim-signature'

" 用于在侧边符号栏显示 git/svn 的 diff
Plug 'mhinz/vim-signify'


" 移动增强
Plug 'rhysd/accelerated-jk'
Plug 'justinmk/vim-sneak'
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
" 全文快速移动，<leader><leader>f{char} 即可触发
Plug 'easymotion/vim-easymotion'

" Git 支持
Plug 'tpope/vim-fugitive'

" signify 调优
let g:signify_vcs_list = ['git']
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = g:signify_sign_change

" git 仓库使用 histogram 算法进行 diff
let g:signify_vcs_cmds = {
	\ 'git': 'git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f',
	\}

"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
" 用 v 选中一个区域后，+/- 按分隔符扩大/缩小选区
Plug 'terryma/vim-expand-region'

" 快速文件搜索
Plug 'junegunn/fzf'

" 给不同语言提供字典补全，插入模式下 c-x c-k 触发
Plug 'asins/vim-dict'

" 配对括号和引号自动补全
Plug 'Raimondi/delimitMate'

"----------------------------------------------------------------------
" 自动生成 ctags/gtags，并提供自动索引功能
" 不在 git/svn 内的项目，需要在项目根目录 touch 一个空的 .root 文件
" 详细用法见：https://zhuanlan.zhihu.com/p/36279445
"----------------------------------------------------------------------

" 提供基于 TAGS 的定义预览，函数参数预览，quickfix 预览
Plug 'skywind3000/vim-preview'

" Tagbar
" Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'
let g:vista#renderer#enable_icon = 1

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

"----------------------------------------------------------------------
" 文本对象：textobj 全家桶
"----------------------------------------------------------------------

" 基础插件：提供让用户方便的自定义文本对象的接口
Plug 'kana/vim-textobj-user'

" indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
Plug 'kana/vim-textobj-indent'

" 语法文本对象：iy/ay 基于语法的文本对象
Plug 'kana/vim-textobj-syntax'

" 函数文本对象：if/af 支持 c/c++/vim/java
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }

" 参数文本对象：i,/a, 包括参数或者列表元素
Plug 'sgur/vim-textobj-parameter'

" 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
Plug 'bps/vim-textobj-python', {'for': 'python'}

" 提供 uri/url 的文本对象，iu/au 表示
Plug 'jceb/vim-textobj-uri'


"----------------------------------------------------------------------
" 文件类型扩展
"----------------------------------------------------------------------

" lua 语法高亮增强
Plug 'tbastos/vim-lua', { 'for': 'lua' }

" rust 语法增强
Plug 'rust-lang/rust.vim', { 'for': 'rust' }


"----------------------------------------------------------------------
" statusline
"----------------------------------------------------------------------
Plug 'itchyny/lightline.vim'
let g:lightline = {
  \ 'colorscheme': 'solarized',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'readonly', 'filename', 'modified', 'method' ] ]
	\ },
	\ 'component_function': {
	\   'method': 'NearestMethodOrFunction'
	\ },
	\ }
"----------------------------------------------------------------------
" NERDTree
"----------------------------------------------------------------------
Plug 'preservim/nerdtree', { 'on': 'NERDTree' } | Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
noremap <space>nn :NERDTree<cr>
noremap <space>no :NERDTreeFocus<cr>
noremap <space>nt :NERDTreeToggle<cr>

"----------------------------------------------------------------------
" ale：动态语法检查
"----------------------------------------------------------------------
Plug 'w0rp/ale'
LoadScript init/plugins/ale.vim

"----------------------------------------------------------------------
" Vim Clap 文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

LoadScript init/plugins/vim-clap.vim

"----------------------------------------------------------------------
" Python
"----------------------------------------------------------------------
if index(g:bundle_group, 'Python') >= 0
	" for python.vim syntax highlight
    Plug 'python-mode/python-mode', { 'branch': 'develop' }
    Plug 'tshirtman/vim-cython'
    let g:pymode = 1
    let g:pymode_python = 'python3'
    let g:pymode_rope = 1
    let g:pymode_lint = 0
    Plug 'psf/black'
    let g:black_virtualenv = "~/.config/black"
endif

"----------------------------------------------------------------------
" JavaScript
"----------------------------------------------------------------------
if index(g:bundle_group, 'JavaScript') >= 0
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
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync
endif

LoadScript init/plugins/ale.vim
" LoadScript init/plugins/tagbar.vim

"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()
