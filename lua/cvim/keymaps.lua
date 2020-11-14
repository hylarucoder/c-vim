local vim = vim;

vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})

vim.api.nvim_set_keymap("n", "<c-n>", ":LuaTreeToggle<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("", "<c-p>", ":lua require'telescope.builtin'.find_files{}<cr>", {})
-- " -- Fuzzy find over git files in your directory
-- " require('telescope.builtin').git_files()

-- " -- Grep files as you type (requires rg currently)
-- " require('telescope.builtin').live_grep()

-- " -- Use builtin LSP to request references under cursor. Fuzzy find over results.
-- " require('telescope.builtin').lsp_references()

-- " -- Convert currently quickfixlist to telescope
-- " require('telescope.builtin').quickfix()

-- " -- Convert currently loclist to telescope
-- " require('telescope.builtin').loclist()
