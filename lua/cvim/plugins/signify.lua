--  signify 调优
vim.g.signify_vcs_list = {"git"}
vim.g.signify_sign_add = "+"
vim.g.signify_sign_delete = "_"
vim.g.signify_sign_delete_first_line = "‾"
vim.g.signify_sign_change = "~"
vim.g.signify_sign_changedelete = "~"

-- git 仓库使用 histogram 算法进行 diff
vim.g.signify_vcs_cmds = {git = "git diff --no-color --diff-algorithm=histogram --no-ext-diff -U0 -- %f"}
