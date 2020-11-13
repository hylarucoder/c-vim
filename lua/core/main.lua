local global = require('core.global')
local vim = vim

local global_local = {
  -- 设置 Backspace 键模式
  bs             = "eol,start,indent";
  -- 自动缩进
  autoindent     = true;
  -- 打开 C/C++ 语言缩进优化
  cindent        = true;
  -- Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
  winaltkeys     = "no";
  -- 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
  ttimeout       = true;
  -- 功能键超时检测 50 毫秒
  ttimeoutlen    = 50;
  -- 显示光标位置
  ruler          = true;
  -- 终端真彩色
  termguicolors  = true;
  -- 折叠level
  foldlevelstart = 99;
  fileformats    = "unix,mac,dos";
  listchars      = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←";
  -- 内部工作编码
  encoding       = "utf-8";
  -- 文件默认编码
  fileencoding   = "utf-8";
  -- 打开文件时自动尝试下面顺序的编码
  fileencodings  = "ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1";
  clipboard      = "unnamedplus";
  wildignorecase = true;
  wildignore     = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**";
  -- 搜索时忽略大小写
  ignorecase     = true;
  -- 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
  smartcase      = true;
  infercase      = true;
  -- 查找输入时动态增量显示查找结果
  incsearch      = true;
  -- 高亮搜索内容
  hlsearch       = true;
  wrapscan       = true;

}

vim.g.clipboard = {
  name = "macOS-clipboard",
  copy = {
    ["+"] = "pbcopy",
    ["*"] = "pbcopy",
  },
  paste = {
    ["+"] = "pbpaste",
    ["*"] = "pbpaste",
  },
  cache_enabled = 0
}
vim.g.python_host_prog = '/usr/bin/python'
vim.g.python3_host_prog = '/usr/local/bin/python3'

for name, value in pairs(global_local) do
  vim.o[name] = value
end

local bw_local = {
  -- 关闭自动换行
  wrap       = false;
  foldenable = true;
  foldmethod = "indent";
}

for name, value in pairs(bw_local) do
  vim.o[name] = value
end
