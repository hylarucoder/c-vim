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

