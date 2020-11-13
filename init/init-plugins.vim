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

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" autocmd BufEnter *.c,*.h,*.cpp,*.md,*.go,*.tsx,*.ts,*.js,*.jsx,*.lua,*.sh,*.py,*.toml,*.html,*.css,*.scss,*.less,*.json,*.yml lua require'completion'.on_attach()
autocmd BufReadPre,BufNewFile * lua require'completion'.on_attach()

nnoremap <C-n> :LuaTreeToggle<CR>
nnoremap <leader>r :LuaTreeRefresh<CR>
nnoremap <leader>n :LuaTreeFindFile<CR>

noremap <space>ht :Startify<cr>
noremap <space>hy :tabnew<cr>:Startify<cr>

function! s:list_commits()
	let git = 'git -C ' . getcwd()
	let commits = systemlist(git . ' log --oneline | head -n5')
	let git = 'G' . git[1:]
	return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

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

