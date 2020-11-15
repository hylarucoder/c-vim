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
