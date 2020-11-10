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
		\ ["S&earch in Project\t\\cx", 'exec "silent! GrepCode! " . expand("<cword>")'],
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
