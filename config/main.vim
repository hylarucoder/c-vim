"==========================================
" Author:  wklken , rafi
" Modified By:  Micheal Gardner
" Email: wklken@yeah.net twocucao@gmail.com
"==========================================

let g:Config_Main_Home = fnamemodify(expand('<sfile>'),
      \ ':p:h:gs?\\?'.((has('win16') || has('win32')
      \ || has('win64'))?'\':'/') . '?')

call cvim#source_rc('init.vim')

if has('nvim')
  " Neovim settings
  call cvim#source_rc('neovim.vim')
elseif ! has('gui_running') && ! has('win32') && ! has('win64')
  " Linux terminal settings
  call cvim#source_rc('terminal.vim')
endif

try
    call cvim#source_rc('functions.vim')
catch
    execute 'set rtp +=' . fnamemodify(g:Config_Main_Home, ':p:h:h')
    call cvim#source_rc('functions.vim')
endtry

call cvim#source_rc('filetype.vim')
call cvim#source_rc('general.vim')
call cvim#source_rc('plugins.vim')
call cvim#source_rc('plugins/pangu.vim')
call cvim#source_rc('mappings.vim')
call cvim#source_rc('filetypes.vim')
call cvim#source_rc('theme.vim')
