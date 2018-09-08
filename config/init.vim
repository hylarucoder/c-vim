let $VIMPATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
let $VARPATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache').'/vim')

" Global Mappings "{{{
" Use spacebar as leader and ; as secondary-leader
" Required before loading plugins!
let g:mapleader="\<Space>"
let g:maplocalleader=','
autocmd! bufwritepost .vimrc source %

" Release keymappings prefixes, evict entirely for use of plug-ins.
nnoremap <Space>  <Nop>
xnoremap <Space>  <Nop>
nnoremap ,        <Nop>
xnoremap ,        <Nop>
nnoremap ;        <Nop>
xnoremap ;        <Nop>
nnoremap m        <Nop>
noremap m        <Nop>

" }}}

" Set augroup
augroup MyAutoCmd
	autocmd!
	autocmd CursorHold *? syntax sync minlines=300
augroup END
