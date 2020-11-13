nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T


function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

LoadScript init/plugins/ale.vim
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

" autocmd BufEnter *.c,*.h,*.cpp,*.md,*.go,*.tsx,*.ts,*.js,*.jsx,*.lua,*.sh,*.py,*.toml,*.html,*.css,*.scss,*.less,*.json,*.yml lua require'completion'.on_attach()
autocmd BufReadPre,BufNewFile * lua require'completion'.on_attach()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"


nnoremap <C-n> :LuaTreeToggle<CR>
nnoremap <leader>r :LuaTreeRefresh<CR>
nnoremap <leader>n :LuaTreeFindFile<CR>

noremap <space>ht :Startify<cr>
noremap <space>hy :tabnew<cr>:Startify<cr>

let g:startify_session_dir = '~/.vim/session'
let g:startify_files_number = 5
let g:startify_change_to_dir = 0
let g:startify_custom_header = [ ]
let g:startify_relative_path = 1
let g:startify_use_env = 1
function! s:list_commits()
	let git = 'git -C ' . getcwd()
	let commits = systemlist(git . ' log --oneline | head -n5')
	let git = 'G' . git[1:]
	return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction
" Custom startup list, only show MRU from current directory/project
let g:startify_lists = [
\  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
\  { 'type': function('s:list_commits'), 'header': [ 'Recent Commits' ] },
\  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
\  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
\  { 'type': 'commands',  'header': [ 'Commands' ]       },
\ ]

let g:startify_commands = [
\   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
\   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
\ ]
map <c-p> :lua require'telescope.builtin'.find_files{}<cr>
map <m-p> :Clap grep2<cr>

" -- Fuzzy find over git files in your directory
" require('telescope.builtin').git_files()

" -- Grep files as you type (requires rg currently)
" require('telescope.builtin').live_grep()

" -- Use builtin LSP to request references under cursor. Fuzzy find over results.
" require('telescope.builtin').lsp_references()

" -- Convert currently quickfixlist to telescope
" require('telescope.builtin').quickfix()

" -- Convert currently loclist to telescope
" require('telescope.builtin').loclist()

