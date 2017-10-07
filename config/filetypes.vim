"==========================================
" FileType Settings  文件类型设置
"==========================================

" 定义新文件类型设置
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part,*.vue set filetype=html

" 定义文件类型的Vim基本设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,rst,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" 打开各类文件时的动作
autocmd FileType markdown,python,javascript,html,css,rst,xml nested :TagbarOpen
autocmd FileType markdown,python,javascript,html,css,rst,xml nested :NERDTree

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
" 保存各类文件时删除多余空格
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" 定义函数AutoSetFileHead，自动插入文件头
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
