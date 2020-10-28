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
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 17:59:31
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


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


highlight WhichKeyFloating cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931

let g:which_key_map =  {}
let g:which_key_map['f'] = {
      \ 'name' : '+file       -- 文件相关' ,
      \ 'h' : ['Startify',  'go home'],
      \ 'n' : [':NERDTree', 'nerdtree'],
      \ 'r' : [':%s/',      'replace current buffer'],
      \ }

let g:which_key_map['c'] = {
      \ 'name' : '+coc/clap   -- coc/clap 相关' ,
      \ 'c' : [':Clap commits', 'git commits'],
      \ 'f' : [':Clap files'  , 'git files'],
      \ 's' : [':Clap grep2'  , 'search by text'],
      \ 't' : [':Clap tags'   , 'tags'],
      \ 'r' : [':CocRestart'  , 'coc restart'],
      \ }

let g:which_key_map['s'] = {
      \ 'name' : '+search     -- 搜索相关',
      \ '/' : [':Clap history',              'history'],
      \ ';' : [':Clap commands',             'commands'],
      \ 'a' : [':Clap ag',                   'text Ag'],
      \ 'B' : [':Clap buffers',              'open buffers'],
      \ 'c' : [':Clap commits',              'commits'],
      \ 'C' : [':Clap bcommits',             'buffer commits'],
      \ 'f' : [':Clap files',                'files'],
      \ 'h' : [':Clap history',              'file history'],
      \ 'H' : [':Clap history:',             'command history'],
      \ 'l' : [':Clap blines',               'Lines in the current buffer'],
      \ 'L' : [':Clap lines',                'lines'] ,
      \ 'm' : [':Clap marks',                'marks'] ,
      \ 'M' : [':Clap maps',                 'normal maps'] ,
      \ 'p' : [':Clap helptags',             'help tags'] ,
      \ 'P' : [':Clap tags',                 'project tags'],
      \ 's' : [':Clap Snippets',             'snippets'],
      \ 'S' : [':Clap colors',               'color schemes'],
      \ 't' : [':Clap btags',                'buffer tags'],
      \ 'T' : [':Clap proj_tags',            'Tags in the current project'],
      \ 'w' : [':Clap grep ++query=<cword>', 'search windows'],
      \ 'v' : [':Clap grep ++query=@visual', 'search windows'],
      \ 'y' : [':Clap filetypes',            'file types'],
      \ 'z' : [':Clap fzf',                  'FZF'],
      \ 'r' : [':Clap grep',                 'search by text'],
      \ 'R' : [':Clap grep2',                'search by text'],
      \ }

let g:which_key_map['g'] = {
      \ 'name' : '+goto       -- 跳转相关' ,
      \ 'd':  ['<Plug>(coc-definition)',            'go to definition'],
      \ 'y':  ['<Plug>(coc-type-definition)',       'go to type definition'],
      \ 'i':  ['<Plug>(coc-implementation)',        'go to implementation'],
      \ 'r':  ['<Plug>(coc-rename)',                'go to rename'],
      \ 'R':  ['<Plug>(coc-references)',            'go to references'],
      \ '[':  ['<Plug>(coc-diagnostic-prev)',       'go to diagnostic prev'],
      \ ']':  ['<Plug>(coc-diagnostic-next)',       'go to diagnostic next'],
      \ 'p':  ['<Plug>(coc-diagnostic-prev-error)', 'go to diagnostic prev error'],
      \ 'n':  ['<Plug>(coc-diagnostic-next-error)', 'go to diagnostic next error'],
      \ }

let g:which_key_map['t'] = {
      \ 'name' : '+text       -- 文本技',
      \ 'a' : ['<Plug>(EasyAlign)',          'text align'],
      \ 's' : [':Clap grep',                 'use vim clap'],
      \ 'S' : [':Clap grep',                 'use vim clap'],
      \ 'p' : [':Clap',                      'use vim clap'],
      \ }

let g:which_key_map['p'] = {
      \ 'name' : '+project    -- 项目相关',
      \ 'f' : [':Clap files',                'find file in project files'],
      \ 's' : [':Clap grep',                 'grep current word in current buffer'],
      \ 'S' : [':Clap grep',                 'grep current word in project'],
      \ 'p' : [':Clap',                      'use vim clap'],
      \ 'w' : [':Clap grep ++query=<cword>', 'use vim clap'],
      \ 'W' : [':Clap grep ++query=@visual', 'use vim clap'],
      \ '?' : [':Clap',                      'use vim clap'],
      \ }

let g:which_key_map['w'] = {
      \ 'name' : '+windows   -- 窗口相关' ,
      \ '-' : ['<C-W>s',     'split-window-below'],
      \ '|' : ['<C-W>v',     'split-window-right'],
      \ 't1' : ['1gt<cr>',    'move tab 1'],
      \ 't2' : ['2gt<cr>',    'move tab 2'],
      \ '?' : ['Windows',    'fzf-window'],
      \ }
call which_key#register('<Space>', "g:which_key_map")


nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
