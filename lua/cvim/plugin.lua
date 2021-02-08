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
  -- Search
  use {"nvim-lua/telescope.nvim", requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}}
  use {"skywind3000/vim-quickui"}
  -- UI
  use {"kyazdani42/nvim-web-devicons"}
  use {"mhinz/vim-startify"}
  use {
    "hoob3rt/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true},
    config = function()
      local lualine = require("lualine")
      lualine.theme = "solarized_dark"
      lualine.separator = "|"
      lualine.sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {"filename"},
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
      }
      lualine.inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
      }
      lualine.extensions = {"fzf"}
      lualine.status()
    end
  }
  use {"nvim-lua/completion-nvim"}
  use {"nvim-lua/lsp-status.nvim"}
  use {"SirVer/ultisnips"}
  use {"honza/vim-snippets"}
  use {"neovim/nvim-lspconfig"}

  -- use {"aca/completion-tabnine", ["do"] = "./install.sh"}
  -- motion
  use {"rhysd/accelerated-jk"}
  use {"junegunn/vim-easy-align"}
  use {"justinmk/vim-sneak"}

  use {"Raimondi/delimitMate"}
  use {"asins/vim-dict"}
  use {"kyazdani42/nvim-tree.lua"}

  use {"preservim/tagbar"}

  use {"luochen1990/rainbow"}
  use {"norcalli/nvim-colorizer.lua"}
  use {"sheerun/vim-polyglot"}
  use {"tpope/vim-abolish"}
  use {"w0rp/ale"}
  -- vcs
  use {"mhinz/vim-signify", {"tpope/vim-fugitive", cmd = {"Gblame", "Gpull", "Gpush", "Gstatus"}}}

  -- treesitter
  use {"nvim-treesitter/nvim-treesitter"}
  use {"nvim-treesitter/nvim-treesitter-textobjects"}

  -- lua
  -- use {"tbastos/vim-lua", ["for"] = {"lua"}},
  use {"tjdevries/nlua.nvim"}
  use {"euclidianAce/BetterLua.vim"}
  use {"andrejlevkovitch/vim-lua-format"}
  -- python
  use {"psf/black"}

  use {"chrisbra/vim-diff-enhanced"}
  -- -- +/- 扩大/缩小选区
  use {"terryma/vim-expand-region"}
  -- -- 基础插件：提供让用户方便的自定义文本对象的接口
  -- "kana/vim-textobj-user",
  -- -- indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
  -- "kana/vim-textobj-indent",
  -- -- 语法文本对象：iy/ay 基于语法的文本对象
  -- "kana/vim-textobj-syntax",
  -- -- 函数文本对象：if/af 支持 c/c++/vim/java
  -- {"kana/vim-textobj-function", ["for"] = {"c", "cpp", "vim", "java"}},
  -- -- 参数文本对象：i,/a, 包括参数或者列表元素
  -- "sgur/vim-textobj-parameter",
  -- -- 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
  -- {"bps/vim-textobj-python", ["for"] = {"python"}},
  -- -- 提供 uri/url 的文本对象，iu/au 表示
  -- "jceb/vim-textobj-uri",

  -- -- rust
  -- {"rust-lang/rust.vim", ["for"] = {"rust"}}

end)
