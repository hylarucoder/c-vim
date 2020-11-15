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
