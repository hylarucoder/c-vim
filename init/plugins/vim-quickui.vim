" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&New File\tCtrl+n", 'echo 0' ],
            \ [ "&Open File\t(F3)", 'echo 1' ],
            \ [ "&Close", 'echo 2' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", 'echo 3'],
            \ [ "Save &As", 'echo 4' ],
            \ [ "Save All", 'echo 5' ],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'echo 6' ],
            \ [ "Home Screen", 'Startify' ],
            \ ])

" items containing tips, tips will display in the cmdline
" 复制粘贴cut
" Find
" Find Usage
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
            \ [ '&Tag Sidebar', 'Vista', 'Tags侧边栏' ],
            \ ])

call quickui#menu#install('&Navigator', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&NERDTree', 'nerdtree', '文件侧边栏' ],
            \ ])

call quickui#menu#install('&Code', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&NERDTree', 'nerdtree', '文件侧边栏' ],
            \ ])

call quickui#menu#install('&Run', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&NERDTree', 'nerdtree', '文件侧边栏' ],
            \ ])

call quickui#menu#install('&Tools', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&NERDTree', 'nerdtree', '文件侧边栏' ],
            \ ])

call quickui#menu#install('&VCS', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&NERDTree', 'nerdtree', '文件侧边栏' ],
            \ ])

call quickui#menu#install('&Clap/Coc', [
            \ [ '&Commits', 'Clap commits', 'git commits' ],
            \ [ '&Files', 'Clap files', 'git files' ],
            \ [ '&Greps', 'Clap grep2', 'search by text' ],
            \ [ '&Tags', 'Clap tags', 'search by tags' ],
            \ ])

call quickui#menu#install('&Search', [
            \ [ '&History', 'Clap commits', 'git commits' ],
            \ [ '&Commands', 'Clap files', 'git files' ],
            \ [ '&Ag', 'Clap grep2', 'search by text' ],
            \ [ '&Buffers', 'Clap tags', 'search by tags' ],
            \ [ '&Commits', 'Clap tags', 'search by tags' ],
            \ [ '&BCommits', 'Clap tags', 'search by tags' ],
            \ [ '&BLines', 'Clap tags', 'search by tags' ],
            \ [ '&Marks', 'Clap tags', 'search by tags' ],
            \ ])

call quickui#menu#install('&Goto', [
            \ [ '&History', 'Clap commits', 'git commits' ],
            \ [ '&Commands', 'Clap files', 'git files' ],
            \ [ '&Ag', 'Clap grep2', 'search by text' ],
            \ [ '&Buffers', 'Clap tags', 'search by tags' ],
            \ [ '&Commits', 'Clap tags', 'search by tags' ],
            \ [ '&BCommits', 'Clap tags', 'search by tags' ],
            \ [ '&BLines', 'Clap tags', 'search by tags' ],
            \ [ '&Marks', 'Clap tags', 'search by tags' ],
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
