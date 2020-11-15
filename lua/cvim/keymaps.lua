local vim = vim;

local nmap = function(key, value)
  vim.fn.nvim_set_keymap("n", key, value, {noremap = true, silent = true});
end

local map = function(key, value)
  vim.fn.nvim_set_keymap("", key, value, {noremap = true, silent = true});
end

-- nmap("j", "<Plug>(accelerated_jk_gj)")
-- nmap("k", "<Plug>(accelerated_jk_gk)")
vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})

nmap("<c-n>", ":LuaTreeToggle<cr>")
map("<c-p>", ":lua require'telescope.builtin'.find_files{}<cr>")
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
