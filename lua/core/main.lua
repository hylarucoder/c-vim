local global = require('core.global')
local vim = vim

local global_local = {
  " 禁用 vi 兼容模式
  nocompatible = true;
  " 设置 Backspace 键模式
  bs="eol,start,indent";
  " 自动缩进
  autoindent=true;
  " 打开 C/C++ 语言缩进优化
  cindent=true;
  " Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
  winaltkeys="no";
  " 关闭自动换行
  nowrap=true;
  " 打开功能键超时检测（终端下功能键为一串 ESC 开头的字符串）
  ttimeout=true;
  " 功能键超时检测 50 毫秒
  ttimeoutlen=50;
  " 显示光标位置
  ruler = true;
  termguicolors = true;
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
