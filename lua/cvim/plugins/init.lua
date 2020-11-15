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

-- Example usageplug {'julia', { g = {default_julia_version = '1.1'} }}
plug("~/.vim/bundles", {
  -- >>>> Appearance <<<< --
  -- icon font
  "kyazdani42/nvim-web-devicons",
  -- 开始画面
  "mhinz/vim-startify",
  -- 自定义菜单/命令
  "skywind3000/vim-quickui",
  "liuchengxu/vim-which-key",

  -- lua utils
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  -- fuzzfinder
  "nvim-lua/telescope.nvim",
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
  "luochen1990/rainbow",
  "nvim-treesitter/nvim-treesitter",

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

--  signify 调优
vim.g.signify_vcs_list = {"git"}
vim.g.signify_sign_add = "+"
vim.g.signify_sign_delete = "_"
vim.g.signify_sign_delete_first_line = "‾"
vim.g.signify_sign_change = "~"
vim.g.signify_sign_changedelete = "~"

-- git 仓库使用 histogram 算法进行 diff
vim.g.signify_vcs_cmds = {git = "git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f"}

vim.g.rainbow_active = 1 -- "set to 0 if you want to enable it later via :RainbowToggle

vim.g["vista#renderer#enable_icon"] = 1

vim.g.black_virtualenv = "~/.config/black"

vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
vim.g.UltiSnipsEditSplit = "vertical"

vim.g.startify_session_dir = "~/.vim/session"
vim.g.startify_files_number = 5
vim.g.startify_change_to_dir = 0
vim.g.startify_relative_path = 1
vim.g.startify_use_env = 1

vim.g.startify_lists = {
  {type = "dir", header = {"Files "}}, -- . getcwd()  },
  -- {type = "function('s:list_commits')", header = {"Recent Commits"}},
  {type = "sessions", header = {"Sessions"}},
  {type = "bookmarks", header = {"Bookmarks"}},
  {type = "commands", header = {"Commands"}}
}

vim.g.startify_commands = {{up = {"Update Plugins", ":PlugUpdate"}}, {ug = {"Upgrade Plugin Manager", ":PlugUpgrade"}}}

vim.g.ale_completion_delay = 500
vim.g.ale_echo_delay = 20
vim.g.ale_lint_delay = 500
vim.g.ale_echo_msg_format = "[%linter%] %code: %%s"

-- 设定检测的时机：normal 模式文字改变，或者离开 insert模式
-- 禁用默认 INSERT 模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
vim.g.ale_lint_on_text_changed = "normal"
vim.g.ale_lint_on_insert_leave = 1

vim.g.ale_command_wrapper = "nice -n5"

vim.g["airline#extensions#ale#enabled"] = 1

vim.ale_linters = {
  c = {"gcc", "cppcheck"},
  cpp = {"gcc", "cppcheck"},
  python = {"flake8", "pylint"},
  lua = {"luac"},
  go = {"go build", "gofmt"},
  java = {"javac"},
  javascript = {"eslint"}
}

vim.g.quickui_show_tip = 1

local function init_quickui()
  vim.fn["quickui#menu#reset"]()

  -- File
  vim.fn["quickui#menu#install"]("&File", {
    {"&Home", "Startify"},
    {"--", ""},
    {"&Open \t(:w)", "echo 0"},
    {"&Save \t(:w)", "write"},
    {"--", ""},
    {"Leaderf &File", "Leaderf file"},
    {"Leaderf &Buffer", "Leaderf buffer"},
    {"LeaderF &Mru", "Leaderf mru --regexMode", "Open recently accessed files"},
    {"--", ""},
    {"Open &Finder", "!open ."},
    {"--", ""},
    {"&Reload Vimrc", "source ~/.config/nvim/init.vim"}
  })

  -- Edit
  vim.fn["quickui#menu#install"]("&Edit", {
    {"&Copy", "Startify"},
    {"&Paste", "Startify"},
    {"--", ""},
    {"Open &Finder", "!open ."},
    {"--", ""},
    {"&Reload Vimrc", "source ~/.config/nvim/init.vim"}
  })

  -- View
  vim.fn["quickui#menu#install"]("&Edit", {
    {"&Explorer", "Startify", "侧边栏"},
    -- View
    {"&Tagbar", "Vista!!"}
  })

  -- Navigate
  vim.fn["quickui#menu#install"]("&Code", {
    {"&Copyright", "Startify", "侧边栏"},
    -- View
    {"&Tagbar", "Startify"}
  })
  -- Git
  vim.fn["quickui#menu#install"]("&Git", {
    {"&Copyright", "Startify", "侧边栏"},
    -- View
    {"&Tagbar", "Startify"}
  })
  -- Option
  vim.fn["quickui#menu#install"]("&Option", {
    {"Set &Spell %{&spell? \"Off\":\"On\"}", "set spell!"},
    {"Set &Cursor Line %{&cursorline? \"Off\":\"On\"}", "set cursorline!"},
    {"Set &Paste %{&paste? \"Off\":\"On\"}", "set paste!"}
  })
  -- Help
  vim.fn["quickui#menu#install"]("H&elp", {
    {"&Cheatsheet", "help index", ""},
    {"T&ips", "help tips", ""},
    {"--", ""},
    {"&Tutorial", "help tutor", ""},
    {"&Quick Reference", "help quickref", ""},
    {"&Summary", "help summary", ""}
  })
end

init_quickui()

vim.g.quickui_color_scheme = "solarized"

vim.g.context_menu_file = {
  {"S&earch in Project", ":lua require'telescope.builtin'.grep_string{search = \"<cword>\"}"},
  {"--"},
  {"Find &Definition", "lua vim.lsp.buf.declaration()<CR>"},
  {"Find &References", "lua vim.lsp.buf.references()<CR>"},
  {"Find &Symbol", "lua vim.lsp.buf.document_symbol()<CR>"},
  {"--"},
  {"Format", "lua vim.lsp.buf.formatting()<CR>"},
  {"Rename", "lua vim.lsp.buf.rename()<CR>"},
  {"Action", "lua vim.lsp.buf.code_action()<CR>"},
  {"--"},
  {"Dash &Help", "call asclib#utils#dash_ft(&ft, expand(\"<cword>\"))"},
  {"Cpp&man", "exec \"Cppman \" . expand(\"<cword>\")", "", "c,cpp"},
  {"P&ython Doc", "call quickui#tools#python_help(\"\")", "python"}
}

vim.g.context_menu_lua_explorer = {
  {"Cre&ate", "a"},
  {"&Edit", "<C-v>"},
  {"&Tab", "<C-v>"},
  {"Toggle ignored", "I"},
  {"Toggle dotfiles", "H"},
  {"Refresh", "R"},
  {"S&earch in Project\t\\cx", "Clap grep ++query=<cword>"}
}

vim.g.which_key_use_floating_win = 1

local which_key_map = {
  o = {name = "+open", ["1"] = {"b1", "buffer 1"}, ["2"] = {"b2", "buffer 1"}},
  b = {name = "+buffer", ["1"] = {"b1", "buffer 1"}, ["2"] = {"b2", "buffer 1"}},
  l = {name = "+language", ["1"] = {"b1", "buffer 1"}, ["2"] = {"b2", "buffer 1"}},
  r = {name = "+rename", ["1"] = {"b1", "buffer 1"}, ["2"] = {"b2", "buffer 1"}}
}

vim.g.which_key_map = which_key_map