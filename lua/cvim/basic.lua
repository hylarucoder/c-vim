local global = require("cvim.global")
local vim = vim

local wildignores = {
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
local global_local = {
  -- 设置 Backspace 键模式
  bs = "eol,start,indent",
  -- 自动缩进
  autoindent = true,
  -- 打开 C/C++ 语言缩进优化
  cindent = true,
  -- Windows 禁用 ALT 操作菜单
  winaltkeys = "no",
  -- 打开功能键超时检测
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
  -- 自动尝试下面顺序的编码
  fileencodings = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1",
  clipboard = "unnamedplus",
  wildignorecase = true,
  wildignore = table.concat(wildignores, ","),
  -- 搜索时忽略大小写
  ignorecase = true,
  -- 智能搜索大小写判断
  smartcase = true,
  infercase = true,
  -- 增量显示查找结果
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

vim.g.clipboard = {
  name = "macOS-clipboard",
  copy = {["+"] = "pbcopy", ["*"] = "pbcopy"},
  paste = {["+"] = "pbpaste", ["*"] = "pbpaste"},
  cache_enabled = 0
}
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_prog = "/usr/local/bin/python3"

for name, value in pairs(global_local) do vim.o[name] = value end

local bw_local = {
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

for name, value in pairs(bw_local) do vim.o[name] = value end

vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.omnifunc = "v:lua.vim.lsp.omnifunc"
vim.o.shortmess = "c"
