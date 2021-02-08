local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  -- Packer can manage itself as an optional plugin
  use {"wbthomason/packer.nvim", opt = true}

  use {"nvim-lua/telescope.nvim"}
  use {"kyazdani42/nvim-web-devicons"}
  use {"nvim-lua/popup.nvim"}
  use {"nvim-lua/plenary.nvim"}

  -- 开始画面
  use {"mhinz/vim-startify"}
  -- 自定义菜单/命令
  use {"skywind3000/vim-quickui"}

  -- Use dependency and run lua function after load
  use {
    "lewis6991/gitsigns.nvim",
    requires = {"nvim-lua/plenary.nvim"},
    config = function()
      require("gitsigns").setup()
    end
  }

  -- You can specify multiple plugins in a single call
  use {"tjdevries/colorbuddy.vim", {"nvim-treesitter/nvim-treesitter", opt = true}}

end)
