setlocal nospell

setlocal nohidden
setlocal iskeyword+=:
setlocal iskeyword+=#
setlocal iskeyword+=-

wincmd L

" Jump to links with enter
nmap <buffer> <CR> <C-]>

" Jump back with backspace
nmap <buffer> <BS> <C-T>

" Skip to next tag (subject anchor)
nmap <buffer> t /\*\S\+\*<CR>l

" Skip to previous tag (subject anchor)
nmap <buffer> T h?\*\S\+\*<CR>l
