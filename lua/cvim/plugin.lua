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
  use {"nvim-lua/plenary.nvim"}

  use {"nvim-lua/telescope.nvim"}
  use {"kyazdani42/nvim-web-devicons"}
  use {"nvim-lua/popup.nvim"}

  -- 开始画面
  use {"mhinz/vim-startify"}
  -- 自定义菜单/命令
  use {"skywind3000/vim-quickui"}

  use {  "justinmk/vim-sneak"}
  use {  "rhysd/accelerated-jk"}
  use {  "kyazdani42/nvim-tree.lua"}
  use {  "liuchengxu/vista.vim"}
  use {  "itchyny/lightline.vim"}
  use {  "nvim-lua/completion-nvim"}
  -- use {  "aca/completion-tabnine", ["do"] = "./install.sh"}
  use {  "kyazdani42/nvim-tree.lua"}
  use {  "liuchengxu/vista.vim"}
  use {  "itchyny/lightline.vim"}
  use {  "SirVer/ultisnips"}
  use {  "honza/vim-snippets"}
  use {  "asins/vim-dict"}
  use {  "Raimondi/delimitMate"}
  use {  "mg979/vim-visual-multi"}
  use {  "neovim/nvim-lspconfig"}
  use {  "nvim-lua/lsp-status.nvim"}
  use {  "sheerun/vim-polyglot"}
  use {  "luochen1990/rainbow"}
  use {  "nvim-treesitter/nvim-treesitter"}
  use {  "nvim-treesitter/nvim-treesitter-textobjects"}
  use {  "preservim/tagbar"}
  use {  "tpope/vim-abolish"}
  use {  "norcalli/nvim-colorizer.lua"}
  use {  "w0rp/ale"}
  use {  "junegunn/vim-easy-align"}
  use {  "psf/black"}
  use {  "tpope/vim-fugitive"}
  use {  "mhinz/vim-signify"}
  use {  "tjdevries/nlua.nvim"}
  use {  "euclidianAce/BetterLua.vim"}
  use {  "andrejlevkovitch/vim-lua-format"}


    -- -- >>>> 文本技 <<<< --
    -- -- Diff 增强，支持 histogram / patience 等更科学的 diff 算法
    -- "chrisbra/vim-diff-enhanced",
    -- -- +/- 扩大/缩小选区
    -- "terryma/vim-expand-region",
    -- -- >>>> textobj <<<< --
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

    -- {"tbastos/vim-lua", ["for"] = {"lua"}},
    -- -- rust
    -- {"rust-lang/rust.vim", ["for"] = {"rust"}}

end)
