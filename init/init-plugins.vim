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


nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:vista#renderer#enable_icon = 1


function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

LoadScript init/plugins/ale.vim

"----------------------------------------------------------------------
" Vim Clap 文件模糊匹配，tags/函数名 选择
"----------------------------------------------------------------------

" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

let g:clap_layout = { 'relative': 'editor' }
let g:clap_theme = 'solarized_dark'

LoadScript init/plugins/starify.vim
LoadScript init/plugins/lua-tree.vim
LoadScript init/plugins/vim-clap.vim
LoadScript init/plugins/vim-quickui.vim

let g:black_virtualenv = "~/.config/black"

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

" autocmd BufEnter *.c,*.h,*.cpp,*.md,*.go,*.tsx,*.ts,*.js,*.jsx,*.lua,*.sh,*.py,*.toml,*.html,*.css,*.scss,*.less,*.json,*.yml lua require'completion'.on_attach()
autocmd BufReadPre,BufNewFile * lua require'completion'.on_attach()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"


