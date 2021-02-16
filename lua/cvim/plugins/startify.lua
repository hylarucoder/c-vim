vim.g.auto_session_root_dir = "~/.vim/auto_sessions/"
vim.g.startify_session_dir = "~/.vim/session"
vim.g.startify_files_number = 10
vim.g.startify_change_to_dir = 0
vim.g.startify_relative_path = 1
vim.g.startify_use_env = 1

vim.g.startify_lists = {
  {type = "dir", header = {"Files "}}, -- . getcwd()  },
  {type = "sessions", header = {"Sessions"}},
  {type = "bookmarks", header = {"Bookmarks"}},
  {type = "commands", header = {"Commands"}}
}

vim.g.startify_bookmarks = {{c = "~/.vimrc"}, {z = "~/.zshrc"}}

vim.g.startify_commands = {
  {t = {"Vim Tutorial", ":h tutorial"}},
  {r = {"Vim Ref", ":h ref"}},
  {pc = {"Plugins Upgrade", ":PackerCompile | PackerSync"}},
  {pi = {"Plugins Install", ":PackerCompile | PackerInstall"}}
}
