" coc config
let g:coc_global_extensions = [
  \ 'coc-eslint', 
  \ 'coc-git', 
  \ 'coc-json', 
  \ 'coc-prettier', 
  \ 'coc-python', 
  \ 'coc-rls', 
  \ 'coc-snippets', 
  \ 'coc-tabnine', 
  \ 'coc-tsserver',
  \ 'coc-yaml', 
  \ ]

"""文档"""
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()


