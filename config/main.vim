"==========================================
" Author:  wklken
" Modified By:  Micheal Gardner
" Email: wklken@yeah.net twocucao@gmail.com
" Sections:
"       -> Initial Plugin 加载插件
"       -> General Settings 基础设置
"       -> Display Settings 展示/排版等界面格式设置
"       -> FileEncode Settings 文件编码设置
"       -> Others 其它配置
"       -> HotKey Settings  自定义快捷键
"       -> FileType Settings  针对文件类型的设置
"       -> Theme Settings  主题设置
"
"       -> 插件配置和具体设置在vimrc.bundles中
"==========================================

let g:Config_Main_Home = fnamemodify(expand('<sfile>'),
      \ ':p:h:gs?\\?'.((has('win16') || has('win32')
      \ || has('win64'))?'\':'/') . '?')

try
    call cvim#source_rc('functions.vim')
catch
    execute 'set rtp +=' . fnamemodify(g:Config_Main_Home, ':p:h:h')
    call cvim#source_rc('functions.vim')
endtry

call cvim#source_rc('init.vim')

"==========================================
" Initial Plugin 加载插件
"==========================================

call cvim#source_rc('plugins.vim')
call cvim#source_rc('general.vim')
call cvim#source_rc('commands.vim')
call cvim#source_rc('filetypes.vim')

"==========================================
" Theme Settings  主题设置
"==========================================
"
" 设置可以高亮的关键字
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono:h14
    " 设置透明度
    set transparency=8
    if has("gui_gtk2")   "GTK2
        set guifont=DejaVu\ Sans\ Mono:h14
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

" theme主题
" set background=dark
set t_Co=256

colorscheme solarized
" colorscheme molokai
" colorscheme desert

" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

nnoremap <F11> :Pangu<CR>
autocmd BufWritePre *.markdown,*.md,*.wiki,*.rst call PanGuSpacing()
