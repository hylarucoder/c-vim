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
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  ["accelerated-jk"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/accelerated-jk"
  },
  ale = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/ale"
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
  ["lightline.vim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
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
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-fugitive"
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
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/twocucao/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
