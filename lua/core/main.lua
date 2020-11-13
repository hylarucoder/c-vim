local global = require(
                 'core.global'
               )
local vim = vim

local wildignores =
  {
    "*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib",
    "*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex",
    "*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    ",
    "*DS_Store*,*.ipch",
    "*.gem",
    "*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso",
    "*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**",
    "*/.nx/**,*.app,*.git,.git",
    "*.wav,*.mp3,*.ogg,*.pcm",
    "*.mht,*.suo,*.sdf,*.jnlp",
    "*.chm,*.epub,*.pdf,*.mobi,*.ttf",
    "*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc",
    "*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps",
    "*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu",
    "*.gba,*.sfc,*.078,*.nds,*.smd,*.smc",
    "*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android"
  }

-- 基础 vim 配置
local global_local =
  {
    -- 设置 Backspace 键模式
    bs = "eol,start,indent",
    -- 自动缩进
    autoindent = true,
    -- 打开 C/C++ 语言缩进优化
    cindent = true,
    -- Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
    winaltkeys = "no",
    -- 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
    ttimeout = true,
    -- 功能键超时检测 50 毫秒
    ttimeoutlen = 50,
    -- 显示光标位置
    ruler = true,
    -- 终端真彩色
    termguicolors = true,
    -- 折叠level
    foldlevelstart = 99,
    fileformats = "unix,mac,dos",
    listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
    -- 内部工作编码
    encoding = "utf-8",
    -- 文件默认编码
    fileencoding = "utf-8",
    -- 打开文件时自动尝试下面顺序的编码
    fileencodings = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1",
    clipboard = "unnamedplus",
    wildignorecase = true,
    wildignore = table.concat(
      wildignores, ","
    ),
    -- 搜索时忽略大小写
    ignorecase = true,
    -- 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
    smartcase = true,
    infercase = true,
    -- 查找输入时动态增量显示查找结果
    incsearch = true,
    -- 高亮搜索内容
    hlsearch = true,
    wrapscan = true,
    backup = false,
    writebackup = false,
    undofile = true,
    swapfile = false,
    showcmd = false,
    cmdheight = 2,
    cmdwinheight = 5,
    laststatus = 2

  }

vim.g.clipboard =
  {
    name = "macOS-clipboard",
    copy = {
      ["+"] = "pbcopy",
      ["*"] = "pbcopy"
    },
    paste = {
      ["+"] = "pbpaste",
      ["*"] = "pbpaste"
    },
    cache_enabled = 0
  }
vim.g.python_host_prog =
  '/usr/bin/python'
vim.g.python3_host_prog =
  '/usr/local/bin/python3'

for name, value in
  pairs(global_local
  ) do vim.o[name] = value end

local bw_local =
  {
    -- 关闭自动换行
    wrap = false,
    linebreak = true,
    number = true,
    foldenable = true,
    foldmethod = "indent",
    expandtab = true,
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = -1
  }

for name, value in
  pairs(bw_local
  ) do vim.o[name] = value end

local vim = vim
local function plug(path,
                    config)
  vim.validate {
    path = {path, 's'},
    config = {
      config, vim.tbl_islist,
      'an array of packages'
    }
  }
  vim.fn["plug#begin"](path
  )
  for _, v in ipairs(config
              ) do
    if type(v
    ) == 'string' then
      vim.fn["plug#"](v
      )
    elseif type(v
    ) == 'table' then
      local p = v[1]
      assert(p,
             'Must specify package as first index.'
      )
      v[1] = nil
      vim.fn["plug#"](p, v
      )
      v[1] = p
    end
  end
  vim.fn["plug#end"]()
end

-- Example usageplug {'julia', { g = {default_julia_version = '1.1'} }}
plug('~/.vim/bundles',
     { -- 展示开始画面，显示最近编辑过的文件
  'glepnir/dashboard-nvim',
  'skywind3000/vim-quickui',
  'liuchengxu/vim-which-key',
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-lua/telescope.nvim',
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',
  'sheerun/vim-polyglot',
  'itchyny/lightline.vim',
  'w0rp/ale', 'psf/black',
  'norcalli/nvim-colorizer.lua', -- Completer
  'nvim-lua/completion-nvim',
  {
    'aca/completion-tabnine',
    ['do'] = './install.sh'
  }, 'SirVer/ultisnips',
  'honza/vim-snippets',

  -- 侧边栏增强
  'liuchengxu/vista.vim', {
    'wfxr/minimap.vim',
    ["do"] = ':!cargo install --locked code-minimap'
  }, -- 文本技
  'junegunn/vim-easy-align',
  -- Diff 增强，支持 histogram / patience 等更科学的 diff 算法
  'chrisbra/vim-diff-enhanced',
  -- " 基础插件：提供让用户方便的自定义文本对象的接口
  'kana/vim-textobj-user',
  -- " indent 文本对象：ii/ai 表示当前缩进，vii 选中当缩进，cii 改写缩进
  'kana/vim-textobj-indent',
  -- " 语法文本对象：iy/ay 基于语法的文本对象
  'kana/vim-textobj-syntax',
  -- " 函数文本对象：if/af 支持 c/c++/vim/java
  {
    'kana/vim-textobj-function',
    ["for"] = {
      'c', 'cpp', 'vim',
      'java'
    }
  },
  -- " 参数文本对象：i,/a, 包括参数或者列表元素
  'sgur/vim-textobj-parameter',
  -- " 提供 python 相关文本对象，if/af 表示函数，ic/ac 表示类
  {
    'bps/vim-textobj-python',
    ["for"] = {'python'}
  },
  -- " 提供 uri/url 的文本对象，iu/au 表示
  'jceb/vim-textobj-uri',
  'tpope/vim-abolish',

  -- 编程语言支持
  'neovim/nvim-lspconfig',
  'nvim-lua/diagnostic-nvim', -- lua support
  'tjdevries/nlua.nvim',
  'euclidianAce/BetterLua.vim',

  -- 支持库，给其他插件用的函数库
  'xolox/vim-misc',

  -- 用于在侧边符号栏显示 marks （ma-mz 记录的位置）
  'kshenoy/vim-signature',
  -- 用于在侧边符号栏显示 git/svn 的 diff
  'mhinz/vim-signify', -- 移动增强
  'rhysd/accelerated-jk',
  'justinmk/vim-sneak',
  -- 全文快速移动，<leader><leader>f{char} 即可触发
  'easymotion/vim-easymotion', -- Git 支持
  'tpope/vim-fugitive',
  -- 用 v 选中一个区域后，+/- 按分隔符扩大/缩小选区
  'terryma/vim-expand-region',
  -- 给不同语言提供字典补全，插入模式下 c-x c-k 触发
  'asins/vim-dict', -- 括号
  'luochen1990/rainbow',
  -- 配对括号和引号自动补全
  'Raimondi/delimitMate', -- " lua 语法高亮增强
  {
    'tbastos/vim-lua',
    ["for"] = {'lua'}
  },
  'andrejlevkovitch/vim-lua-format', -- " rust 语法增强
  {
    'rust-lang/rust.vim',
    ["for"] = {'rust'}
  }
}
)
