"======================================================================
" require init.lua
"======================================================================

" 防止重复加载
if get(s:, 'loaded', 0) != 0
  finish
else
  let s:loaded = 1
endif

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/opt/homebrew/bin/python3'
let g:ruby_host_prog = exepath('neovim-ruby-host')
let g:node_host_prog = '/usr/local/lib/node_modules/neovim/bin/cli.js'

augroup filetypedetect
  au BufNewFile,BufRead *.zshrc,*.zsh,*.zsh-theme,*.functions,*.aliases set filetype=sh
  au BufRead,BufNewFile *.py              setf python
  au BufRead,BufNewFile *.svg             setf svg
  au BufRead,BufNewFile *.haml            setf haml
  au BufRead,BufNewFile *.txt		          setf text
  au BufRead,BufNewFile *.vim             setf vim

  au BufNewFile,BufRead *.sh              setf sh
  au BufNewFile,BufRead *.yml             setf yaml
  au BufNewFile,BufRead *.yaml            setf yaml
  au BufNewFile,BufRead *.toml            setf toml
  au BufNewFile,BufRead *.rc              setf javascript

  au BufNewFile,BufRead *.ts              setf typescript
  au BufNewFile,BufRead *.json		        setf json

  au BufNewFile,BufRead *.lua				      setf lua
  au BufNewFile,BufRead *.md				      setf markdown
  au BufNewFile,BufRead	*.wiki			      setf vimwiki
  au BufNewFile,BufRead supervisor*.conf  setf dosini
augroup END


let g:mapleader = "\<Space>"
let g:maplocalleader = ","

lua require("cvim").bootstrap()
" 似乎放在 lua 里不生效
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


autocmd FileType vim,py,rb,lua,md nnoremap <buffer> <silent>K :lua require('cvim.plugins.quickui').call_context_menu()<cr>

" tmux hack
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

" 设置黑色背景
set background=dark

" 允许 256 色
set t_Co=256

" 设置颜色主题，会在所有 runtimepaths 的 colors 目录寻找同名配置
color gruvbox


autocmd BufWrite *.lua call LuaFormat()

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
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>


"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
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

autocmd BufWritePost plugin.lua PackerCompile
" autocmd BufWritePost *.md %!autocorrect %
" nnoremap gp :silent %!autocorrect %<CR>

