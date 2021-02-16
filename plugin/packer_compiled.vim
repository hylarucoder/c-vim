" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/twocucao/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/twocucao/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/twocucao/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/twocucao/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/twocucao/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, err = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(err)
  end
end

_G.packer_plugins = {
  ["accelerated-jk"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/accelerated-jk"
  },
  ale = {
    commands = { "ALEEnable" },
    config = { "vim.cmd[[ALEEnable]]" },
    loaded = false,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/opt/ale"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/asynctasks.vim"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  black = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/black"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  delimitMate = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/delimitMate"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÅ\3\0\0\3\0\27\0(6\0\0\0'\2\1\0B\0\2\2'\1\3\0=\1\2\0'\1\5\0=\1\4\0005\1\b\0005\2\a\0=\2\t\0015\2\n\0=\2\v\0015\2\f\0=\2\r\0015\2\14\0=\2\15\0015\2\16\0=\2\17\0015\2\18\0=\2\19\1=\1\6\0005\1\21\0004\2\0\0=\2\t\0014\2\0\0=\2\v\0015\2\22\0=\2\r\0015\2\23\0=\2\15\0014\2\0\0=\2\17\0014\2\0\0=\2\19\1=\1\20\0005\1\25\0=\1\24\0009\1\26\0B\1\1\1K\0\1\0\vstatus\1\2\0\0\bfzf\15extensions\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\22inactive_sections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\rsections\6|\14separator\19solarized_dark\ntheme\flualine\frequire\0" },
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  rainbow = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/rainbow"
  },
  tagbar = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope-asynctasks.nvim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/telescope-asynctasks.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-dict"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-dict"
  },
  ["vim-diff-enhanced"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-diff-enhanced"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-expand-region"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-expand-region"
  },
  ["vim-fugitive"] = {
    commands = { "Gblame", "Gpull", "Gpush", "Gstatus" },
    loaded = false,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-lua"] = {
    loaded = false,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/opt/vim-lua"
  },
  ["vim-lua-format"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-lua-format"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-quickui"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-quickui"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-sneak"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-startify"
  }
}

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\nÅ\3\0\0\3\0\27\0(6\0\0\0'\2\1\0B\0\2\2'\1\3\0=\1\2\0'\1\5\0=\1\4\0005\1\b\0005\2\a\0=\2\t\0015\2\n\0=\2\v\0015\2\f\0=\2\r\0015\2\14\0=\2\15\0015\2\16\0=\2\17\0015\2\18\0=\2\19\1=\1\6\0005\1\21\0004\2\0\0=\2\t\0014\2\0\0=\2\v\0015\2\22\0=\2\r\0015\2\23\0=\2\15\0014\2\0\0=\2\17\0014\2\0\0=\2\19\1=\1\20\0005\1\25\0=\1\24\0009\1\26\0B\1\1\1K\0\1\0\vstatus\1\2\0\0\bfzf\15extensions\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\22inactive_sections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\rsections\6|\14separator\19solarized_dark\ntheme\flualine\frequire\0", "config", "lualine.nvim")

-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file Gblame lua require("packer.load")({'vim-fugitive'}, { cmd = "Gblame", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Gpull lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpull", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Gpush lua require("packer.load")({'vim-fugitive'}, { cmd = "Gpush", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Gstatus lua require("packer.load")({'vim-fugitive'}, { cmd = "Gstatus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file ALEEnable lua require("packer.load")({'ale'}, { cmd = "ALEEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType html ++once lua require("packer.load")({'ale'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'ale'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'ale'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'ale'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'vim-lua'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'ale'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType racket ++once lua require("packer.load")({'ale'}, { ft = "racket" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'ale'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'ale'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'ale'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'ale'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'ale'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
