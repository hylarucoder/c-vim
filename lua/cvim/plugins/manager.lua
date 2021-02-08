local manager = {}

local function plug(path, config)
  vim.validate {path = {path, "s"}, config = {config, vim.tbl_islist, "an array of packages"}}
  vim.fn["plug#begin"](path)
  for _, v in ipairs(config) do
    if type(v) == "string" then
      vim.fn["plug#"](v)
    elseif type(v) == "table" then
      local p = v[1]
      assert(p, "Must specify package as first index.")
      v[1] = nil
      vim.fn["plug#"](p, v)
      v[1] = p
    end
  end
  vim.fn["plug#end"]()
end

function manager.init()
  plug("~/.vim/bundles", {
    -- >>>> Appearance <<<< --

    -- fuzzfinder
    -- file explorer
    "kyazdani42/nvim-tree.lua",
    -- tagbar
    "liuchengxu/vista.vim",
    -- status bar
    "itchyny/lightline.vim",
    -- Completor
    "nvim-lua/completion-nvim",
    {"aca/completion-tabnine", ["do"] = "./install.sh"}, -- 侧边栏增强
    "SirVer/ultisnips",
    "honza/vim-snippets", -- 侧边栏增强
    "asins/vim-dict",
    -- 配对括号和引号自动补全
    "Raimondi/delimitMate",
    "mg979/vim-visual-multi",
    -- language server
    "neovim/nvim-lspconfig",
    "nvim-lua/lsp-status.nvim",

    -- >>>> 移动增强 <<<< --
    -- s for /?, one char for FfTt
    "justinmk/vim-sneak",
    "rhysd/accelerated-jk",

    -- >>>> 文本技 <<<< --
    -- Diff 增强，支持 histogram / patience 等更科学的 diff 算法
    "chrisbra/vim-diff-enhanced",
    -- +/- 扩大/缩小选区
    "terryma/vim-expand-region",
    -- >>>> textobj <<<< --
    -- 基础插件：提供让用户方便的自定义文本对象的接口
    "kana/vim-textobj-user",
    -- indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
    "kana/vim-textobj-indent",
    -- 语法文本对象：iy/ay 基于语法的文本对象
    "kana/vim-textobj-syntax",
    -- 函数文本对象：if/af 支持 c/c++/vim/java
    {"kana/vim-textobj-function", ["for"] = {"c", "cpp", "vim", "java"}},
    -- 参数文本对象：i,/a, 包括参数或者列表元素
    "sgur/vim-textobj-parameter",
    -- 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
    {"bps/vim-textobj-python", ["for"] = {"python"}},
    -- 提供 uri/url 的文本对象，iu/au 表示
    "jceb/vim-textobj-uri",
    "tpope/vim-abolish",

    -- >>>> Syntax Highlight <<<< --
    "sheerun/vim-polyglot",
    "luochen1990/rainbow",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "preservim/tagbar",

    "norcalli/nvim-colorizer.lua",
    -- >>>> Linter <<<< --
    "w0rp/ale",
    -- >>>> Formatter <<<< --
    "junegunn/vim-easy-align",
    "psf/black",

    -- >>>> VSC GIT <<<< --
    "tpope/vim-fugitive",
    "mhinz/vim-signify",

    -- lua
    "tjdevries/nlua.nvim",
    "euclidianAce/BetterLua.vim",
    {"tbastos/vim-lua", ["for"] = {"lua"}},
    "andrejlevkovitch/vim-lua-format", -- " rust 语法增强
    -- rust
    {"rust-lang/rust.vim", ["for"] = {"rust"}}
  })
end

return manager
