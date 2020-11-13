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
	let g:bundle_group = ['textobj']
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
Plug 'glepnir/dashboard-nvim'

let g:dashboard_custom_shortcut={
	\ 'last_session'       : '<Leader> s l',
	\ 'find_history'       : '<Leader> f h',
	\ 'find_file'          : '<Leader> f f',
	\ 'new_file'           : '<Leader> c n',
	\ 'change_colorscheme' : '<Leader> t c',
	\ 'find_word'          : '<Leader> f a',
	\ 'book_marks'         : '<Leader> f b',
	\ }


" 对齐
Plug 'junegunn/vim-easy-align'

" Diff 增强，支持 histogram / patience 等更科学的 diff 算法
Plug 'chrisbra/vim-diff-enhanced'

" Completer
Plug 'nvim-lua/completion-nvim'
Plug 'aca/completion-tabnine', { 'do': './install.sh' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" diagnostic
Plug 'nvim-lua/diagnostic-nvim'
" language server protocol
Plug 'neovim/nvim-lspconfig'


" lua support
Plug 'tjdevries/nlua.nvim'
Plug 'euclidianAce/BetterLua.vim'

" 支持库，给其他插件用的函数库
Plug 'xolox/vim-misc'

" 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
Plug 'kshenoy/vim-signature'

" 用于在侧边符号栏显示 git/svn 的 diff
Plug 'mhinz/vim-signify'

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


" 移动增强
Plug 'rhysd/accelerated-jk'
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

Plug 'justinmk/vim-sneak'
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
" 全文快速移动，<leader><leader>f{char} 即可触发
Plug 'easymotion/vim-easymotion'

" Git 支持
Plug 'tpope/vim-fugitive'

"----------------------------------------------------------------------
" 增强插件
"----------------------------------------------------------------------
" 用 v 选中一个区域后，+/- 按分隔符扩大/缩小选区
Plug 'terryma/vim-expand-region'

" 快速文件搜索
Plug 'junegunn/fzf'

" 给不同语言提供字典补全，插入模式下 c-x c-k 触发
Plug 'asins/vim-dict'

" 括号
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" 配对括号和引号自动补全
Plug 'Raimondi/delimitMate'

Plug 'liuchengxu/vista.vim'
let g:vista#renderer#enable_icon = 1

Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}


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

Plug 'tpope/vim-abolish'



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
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

"----------------------------------------------------------------------
" Better
"----------------------------------------------------------------------

Plug 'skywind3000/vim-quickui'

Plug 'liuchengxu/vim-which-key'

"----------------------------------------------------------------------
" File Explorer
"----------------------------------------------------------------------
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'


"----------------------------------------------------------------------
" ale：动态语法检查
"----------------------------------------------------------------------
Plug 'w0rp/ale'
LoadScript init/plugins/ale.vim

"----------------------------------------------------------------------
" polyglot：所有语言
"----------------------------------------------------------------------
Plug 'sheerun/vim-polyglot'




"----------------------------------------------------------------------
" Vim Clap 文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------

Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

let g:clap_layout = { 'relative': 'editor' }
let g:clap_theme = 'solarized_dark'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

"----------------------------------------------------------------------
" Python
"----------------------------------------------------------------------
Plug 'psf/black'
let g:black_virtualenv = "~/.config/black"

"----------------------------------------------------------------------
" 结束插件安装
"----------------------------------------------------------------------
call plug#end()

LoadScript init/plugins/nerdtree.vim
LoadScript init/plugins/vim-clap.vim
LoadScript init/plugins/vim-quickui.vim

" vimrc
let g:completion_chain_complete_list = {
    \ 'default': [
    \    {'complete_items': ['lsp', 'snippet', 'tabnine' ]},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \]
\}
let g:completion_enable_snippet = 'UltiSnips'

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

autocmd BufEnter *.c,*.h,*.cpp,*.md,*.go,*.tsx,*.ts,*.js,*.jsx,*.lua,*.sh,*.py,*.toml,*.html,*.css,*.scss,*.less,*.json,*.yml lua require'completion'.on_attach()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"


let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
let g:which_key_use_floating_win = 1


" Define prefix dictionary
let g:which_key_map =  {}

" Second level dictionaries:
" 'name' is a special field. It will define the name of the group, e.g., leader-f is the "+file" group.
" Unnamed groups will show a default empty string.

" =======================================================
" Create menus based on existing mappings
" =======================================================
" You can pass a descriptive text to an existing mapping.

let g:which_key_map.f = { 'name' : '+file' }

nnoremap <silent> <leader>fs :update<CR>
let g:which_key_map.f.s = 'save-file'

nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
let g:which_key_map.f.d = 'open-vimrc'

nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ }

" =======================================================
" Create menus not based on existing mappings:
" =======================================================
" Provide commands(ex-command, <Plug>/<C-W>/<C-d> mapping, etc.)
" and descriptions for the existing mappings.
"
" Note:
" Some complicated ex-cmd may not work as expected since they'll be
" feed into `feedkeys()`, in which case you have to define a decicated
" Command or function wrapper to make it work with vim-which-key.
" Ref issue #126, #133 etc.
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }

let g:which_key_map.l = {
      \ 'name' : '+lsp',
      \ 'f' : ['spacevim#lang#util#Format()'          , 'formatting']       ,
      \ 'r' : ['spacevim#lang#util#FindReferences()'  , 'references']       ,
      \ 'R' : ['spacevim#lang#util#Rename()'          , 'rename']           ,
      \ 's' : ['spacevim#lang#util#DocumentSymbol()'  , 'document-symbol']  ,
      \ 'S' : ['spacevim#lang#util#WorkspaceSymbol()' , 'workspace-symbol'] ,
      \ 'g' : {
        \ 'name': '+goto',
        \ 'd' : ['spacevim#lang#util#Definition()'     , 'definition']      ,
        \ 't' : ['spacevim#lang#util#TypeDefinition()' , 'type-definition'] ,
        \ 'i' : ['spacevim#lang#util#Implementation()' , 'implementation']  ,
        \ },
      \ }

" highlight WhichKey          Function
" highlight WhichKeySeperator DiffAdded
" highlight WhichKeyGroup     Keyword
" highlight WhichKeyDesc      Identifier
highlight WhichKeyFloating ctermbg=232
highlight WhichKeyDesc      ctermbg=111

