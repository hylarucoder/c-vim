"======================================================================
" require init.lua
"======================================================================

" 防止重复加载
if get(s:, 'loaded', 0) != 0
	finish
else
	let s:loaded = 1
endif

lua require("lua.cvim").bootstrap()
" 似乎放在 lua 里不生效
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" autocmd BufEnter *.c,*.h,*.cpp,*.md,*.go,*.tsx,*.ts,*.js,*.jsx,*.lua,*.sh,*.py,*.toml,*.html,*.css,*.scss,*.less,*.json,*.yml lua require'completion'.on_attach()
autocmd BufReadPre,BufNewFile * lua require'completion'.on_attach()


call quickui#menu#reset()

call quickui#menu#install('&File', [
		\ [ "&Home", 'Startify' ],
		\ [ "--", '' ],
		\ [ "&Open \t(:w)", 'echo 0' ],
		\ [ "&Save \t(:w)", 'write' ],
		\ [ "--", '' ],
		\ [ "Leaderf &File", 'Leaderf file'],
		\ [ "Leaderf &Buffer", 'Leaderf buffer'],
		\ [ "LeaderF &Mru", 'Leaderf mru --regexMode', 'Open recently accessed files'],
		\ [ "--", '' ],
		\ [ "Open &Finder", '!open .' ],
		\ [ "--", '' ],
		\ [ "&Reload Vimrc", 'source ~/.config/nvim/init.vim' ],
		\ ])

call quickui#menu#install('&Edit', [
		\ [ '&Copy', 'echo 1', 'help 1' ],
		\ [ '&Paste', 'echo 2', 'help 2' ],
		\ [ "--", '' ],
		\ [ '&Find', 'echo 3', 'help 3' ],
		\ [ 'Find Usage', 'echo 3', 'help 3' ],
		\ [ "--", '' ],
		\ [ 'Macro', 'echo 3', 'help 3' ],
		\ [ "--", '' ],
		\ ])

call quickui#menu#install('&View', [
		\ [ '&File Explorer', 'nerdtree', '文件侧边栏' ],
		\ [ '&Tag Sidebar', 'Vista!!', 'Tags侧边栏' ],
		\ ])

" tags 相关
call quickui#menu#install('&Navigate', [
		\ [ "&File", 'Leaderf file'],
		\ [ "&Buffer Tags", 'Leaderf bufTag'],
		\ [ "&Last Edit Line", '`.'],
		\ ])

call quickui#menu#install('&Code', [
		\ [ '&Copyright', 'echo 1', 'help 1' ],
		\ [ '&Snippets', 'echo 2', 'help 2' ],
		\ [ '&NERDTree', 'nerdtree', '文件侧边栏' ],
		\ ])

call quickui#menu#install('&Run', [
		\ [ '&Copy', 'echo 1', 'help 1' ],
		\ [ '&Paste', 'echo 2', 'help 2' ],
		\ [ '&NERDTree', 'nerdtree', '文件侧边栏' ],
		\ ])

call quickui#menu#install('&Plugin', [
		\ ["&NERDTree\t<space>tn", 'NERDTreeToggle', 'toggle nerdtree'],
		\ ['&Tagbar', '', 'toggle tagbar'],
		\ ["&Choose Window/Tab\tAlt+e", "ChooseWin", "fast switch win/tab with vim-choosewin"],
		\ ["-"],
		\ ["&Browse in github\trhubarb", "Gbrowse", "using tpope's rhubarb to open browse and view the file"],
		\ ["&Startify", "Startify", "using tpope's rhubarb to open browse and view the file"],
		\ ["&Gist", "Gist", "open gist with mattn/gist-vim"],
		\ ["&Edit Note", "Note", "edit note with vim-notes"],
		\ ["&Display Calendar", "Calendar", "display a calender"],
		\ ['Toggle &Vista', 'Vista!!', ''],
		\ ["-"],
		\ ["Plugin &List", "PlugList", "Update list"],
		\ ["Plugin &Update", "PlugUpdate", "Update plugin"],
		\ ])

call quickui#menu#install('&Git', [
		\ [ '&Blame', 'Gblame', '谁修改了代码' ],
		\ [ '&Paste', 'echo 2', 'help 2' ],
		\ [ '&NERDTree', 'nerdtree', '文件侧边栏' ],
		\ ])

call quickui#menu#install('&Leaderf/Coc', [
		\ [ '&Commits', 'Leaderf commits', 'git commits' ],
		\ [ '&Files', 'Leaderf files', 'git files' ],
		\ [ '&Greps', 'Leaderf grep2', 'search by text' ],
		\ [ '&Tags', 'Leaderf tags', 'search by tags' ],
		\ ])

call quickui#menu#install('&Search', [
		\ [ '&History', 'Leaderf commits', 'git commits' ],
		\ [ '&Commands', 'Leaderf files', 'git files' ],
		\ [ '&Ag', 'Leaderf grep2', 'search by text' ],
		\ [ '&Buffers', 'Leaderf tags', 'search by tags' ],
		\ [ '&Commits', 'Leaderf tags', 'search by tags' ],
		\ [ '&BCommits', 'Leaderf tags', 'search by tags' ],
		\ [ '&BLines', 'Leaderf tags', 'search by tags' ],
		\ [ '&Marks', 'Leaderf tags', 'search by tags' ],
		\ ])

call quickui#menu#install('&Goto', [
		\ [ '&History', 'Leaderf commits', 'git commits' ],
		\ [ '&Commands', 'Leaderf files', 'git files' ],
		\ [ '&Ag', 'Leaderf grep2', 'search by text' ],
		\ [ '&Buffers', 'Leaderf tags', 'search by tags' ],
		\ [ '&Commits', 'Leaderf tags', 'search by tags' ],
		\ [ '&BCommits', 'Leaderf tags', 'search by tags' ],
		\ [ '&BLines', 'Leaderf tags', 'search by tags' ],
		\ [ '&Marks', 'Leaderf tags', 'search by tags' ],
		\ ])

call quickui#menu#install("&Option", [
		\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
		\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
		\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
		\ ])

" register HELP menu with weight 10000
call quickui#menu#install('H&elp', [
		\ ["&Cheatsheet", 'help index', ''],
		\ ['T&ips', 'help tips', ''],
		\ ['--',''],
		\ ["&Tutorial", 'help tutor', ''],
		\ ['&Quick Reference', 'help quickref', ''],
		\ ['&Summary', 'help summary', ''],
		\ ], 10000)

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>

let g:context_menu_k = [
		\ ["&Peek Definition\tAlt+;", 'call quickui#tools#preview_tag("")'],
		\ ["S&earch in Project\t\\cx", 'Clap grep ++query=<cword>'],
		\ [ "--", ],
		\ [ "Find &Definition\t\\cg", 'call MenuHelp_Fscope("g")', 'GNU Global search g'],
		\ [ "Find &Symbol\t\\cs", 'call MenuHelp_Fscope("s")', 'GNU Gloal search s'],
		\ [ "Find &Called by\t\\cd", 'call MenuHelp_Fscope("d")', 'GNU Global search d'],
		\ [ "Find C&alling\t\\cc", 'call MenuHelp_Fscope("c")', 'GNU Global search c'],
		\ [ "Find &From Ctags\t\\cz", 'call MenuHelp_Fscope("z")', 'GNU Global search c'],
		\ [ "--", ],
		\ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
		\ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
		\ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
		\ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
		\ [ "--", ],
		\ ['Dash &Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
		\ ['Cpp&man', 'exec "Cppman " . expand("<cword>")', '', 'c,cpp'],
		\ ['P&ython Doc', 'call quickui#tools#python_help("")', 'python'],
\ ]

nnoremap <silent>K :call quickui#tools#clever_context('k', g:context_menu_k, {})<cr>

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_use_floating_win = 1

let g:which_key_map =  {}

let g:which_key_map.o = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ }

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

highlight WhichKeyFloating ctermbg=232
highlight WhichKeyDesc      ctermbg=111


set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum

" Highlight TODO, FIXME, NOTE, etc.
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')

set guifont=FiraCode\ Nerd\ Font\ Mono:h16


" 打开文件时恢复上一次光标所在位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

"----------------------------------------------------------------------
" 文件类型微调
"----------------------------------------------------------------------
augroup InitFileTypesGroup

	" 清除同组的历史 autocommand
	au!

	" C/C++ 文件使用 // 作为注释
	au FileType c,cpp setlocal commentstring=//\ %s

	" markdown 允许自动换行
	au FileType markdown setlocal wrap

	" lisp 进行微调
	au FileType lisp setlocal ts=8 sts=2 sw=2 et

	" scala 微调
	au FileType scala setlocal sts=4 sw=4 noet

	" haskell 进行微调
	au FileType haskell setlocal et

	" quickfix 隐藏行号
	au FileType qf setlocal nonumber

augroup END


"----------------------------------------------------------------------
" 颜色主题：色彩文件位于 colors 目录中
"----------------------------------------------------------------------

" 设置黑色背景
set background=dark

" 允许 256 色
set t_Co=256

" 设置颜色主题，会在所有 runtimepaths 的 colors 目录寻找同名配置
color neosolarized


"----------------------------------------------------------------------
" 状态栏设置
"----------------------------------------------------------------------
set statusline=                                 " 清空状态了
set statusline+=\ %F                            " 文件名
set statusline+=\ [%1*%M%*%n%R%H]               " buffer 编号和状态
set statusline+=%=                              " 向右对齐
set statusline+=\ %y                            " 文件类型

" 最右边显示文件编码和行号等信息，并且固定在一个 group 中，优先占位
set statusline+=\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %v:%l/%L%)

autocmd BufWrite *.lua call LuaFormat()

"----------------------------------------------------------------------
" 更改样式
"----------------------------------------------------------------------

" 更清晰的错误标注：默认一片红色背景，语法高亮都被搞没了
" 只显示红色或者蓝色下划线或者波浪线
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! clear SpellLocal

hi! SpellBad term=standout ctermfg=1 term=underline cterm=underline
hi! SpellCap term=underline cterm=underline
hi! SpellRare term=underline cterm=underline
hi! SpellLocal term=underline cterm=underline

" 去掉 sign column 的白色背景
hi! SignColumn guibg=NONE ctermbg=NONE

" 修改行号为浅灰色，默认主题的黄色行号很难看，换主题可以仿照修改
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE 
	\ gui=NONE guifg=DarkGrey guibg=NONE

" 修正补全目录的色彩：默认太难看
hi! Pmenu guibg=gray guifg=black ctermbg=gray ctermfg=black
hi! PmenuSel guibg=gray guifg=brown ctermbg=brown ctermfg=gray


"----------------------------------------------------------------------
" 终端设置，隐藏行号和侧边栏
"----------------------------------------------------------------------
if has('terminal') && exists(':terminal') == 2
	if exists('##TerminalOpen')
		augroup VimUnixTerminalGroup
			au! 
			au TerminalOpen * setlocal nonumber signcolumn=no
		augroup END
	endif
endif


"======================================================================
"
" init-keymaps.vim - 按键设置，按你喜欢更改
"
"   - 快速移动
"   - 标签切换
"   - 窗口切换
"   - 终端支持
"   - 编译运行
"   - 符号搜索
"
"======================================================================


"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>


"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>


"----------------------------------------------------------------------
" ALT+N 切换 tab
"----------------------------------------------------------------------
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 10<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 10<cr>


"----------------------------------------------------------------------
" 缓存：插件 unimpaired 中定义了 [b, ]b 来切换缓存
"----------------------------------------------------------------------
noremap <silent> <leader>bn :bn<cr>
noremap <silent> <leader>bp :bp<cr>


"----------------------------------------------------------------------
" 窗口切换：CTRL+hjkl
"----------------------------------------------------------------------

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"----------------------------------------------------------------------
" 编译运行 C/C++ 项目
" 详细见：http://www.skywind.me/blog/archives/2084
"----------------------------------------------------------------------

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" F9 编译 C/C++ 文件
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" F5 运行文件
nnoremap <silent> <F5> :call ExecuteFile()<cr>

" F7 编译项目
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>

" F8 运行项目
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

" F6 测试项目
nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>

" 更新 cmake
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>

"----------------------------------------------------------------------
" F5 运行当前文件：根据文件类型判断方法，并且输出到 quickfix 窗口
"----------------------------------------------------------------------
function! ExecuteFile()
	let cmd = ''
	if index(['c', 'cpp', 'rs', 'go'], &ft) >= 0
		" native 语言，把当前文件名去掉扩展名后作为可执行运行
		" 写全路径名是因为后面 -cwd=? 会改变运行时的当前路径，所以写全路径
		" 加双引号是为了避免路径中包含空格
		let cmd = '"$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
	elseif &ft == 'python'
		let $PYTHONUNBUFFERED=1 " 关闭 python 缓存，实时看到输出
		let cmd = 'python "$(VIM_FILEPATH)"'
	elseif &ft == 'javascript'
		let cmd = 'node "$(VIM_FILEPATH)"'
	elseif &ft == 'perl'
		let cmd = 'perl "$(VIM_FILEPATH)"'
	elseif &ft == 'ruby'
		let cmd = 'ruby "$(VIM_FILEPATH)"'
	elseif &ft == 'php'
		let cmd = 'php "$(VIM_FILEPATH)"'
	elseif &ft == 'lua'
		let cmd = 'lua "$(VIM_FILEPATH)"'
	elseif &ft == 'zsh'
		let cmd = 'zsh "$(VIM_FILEPATH)"'
	elseif &ft == 'ps1'
		let cmd = 'powershell -file "$(VIM_FILEPATH)"'
	elseif &ft == 'vbs'
		let cmd = 'cscript -nologo "$(VIM_FILEPATH)"'
	elseif &ft == 'sh'
		let cmd = 'bash "$(VIM_FILEPATH)"'
	else
		return
	endif
endfunc



"----------------------------------------------------------------------
" F2 在项目目录下 Grep 光标下单词，默认 C/C++/Py/Js ，扩展名自己扩充
" 支持 rg/grep/findstr ，其他类型可以自己扩充
" 不是在当前目录 grep，而是会去到当前文件所属的项目目录 project root
" 下面进行 grep，这样能方便的对相关项目进行搜索
"----------------------------------------------------------------------
if executable('rg')
	noremap <silent><F2> :AsyncRun! -cwd=<root> rg -n --no-heading 
				\ --color never -g *.h -g *.c* -g *.py -g *.js -g *.vim 
				\ <C-R><C-W> "<root>" <cr>
elseif has('win32') || has('win64')
	noremap <silent><F2> :AsyncRun! -cwd=<root> findstr /n /s /C:"<C-R><C-W>" 
				\ "\%CD\%\*.h" "\%CD\%\*.c*" "\%CD\%\*.py" "\%CD\%\*.js"
				\ "\%CD\%\*.vim"
				\ <cr>
else
	noremap <silent><F2> :AsyncRun! -cwd=<root> grep -n -s -R <C-R><C-W> 
				\ --include='*.h' --include='*.c*' --include='*.py' 
				\ --include='*.js' --include='*.vim'
				\ '<root>' <cr>
endif


