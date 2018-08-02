let $VIMPATH = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/main.vim'
