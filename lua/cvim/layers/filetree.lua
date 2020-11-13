local vim = vim

vim.g.lua_tree_side = 'left'
vim.g.lua_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.lua_tree_show_icons = {
  git= 1,
  folders= 1,
  files= 1,
}
vim.g.lua_tree_bindings = {
  edit            = {'<CR>', 'o'},
  edit_vsplit     = '<C-v>',
  edit_split      = '<C-x>',
  edit_tab        = '<C-t>',
  toggle_ignored  = 'I',
  toggle_dotfiles = 'H',
  refresh         = 'R',
  preview         = '<Tab>',
  cd              = '<C-]>',
  create          = 'a',
  remove          = 'd',
  rename          = 'r',
  cut             = 'x',
  copy            = 'c',
  paste           = 'p',
  prev_git_item   = '[c',
  next_git_item   = ']c',
}

vim.g.lua_tree_icons = {
  default= '',
  symlink= '',
  git = {
    unstaged= "✗",
    staged= "✓",
    unmerged= "",
    renamed= "➜",
    untracked= "★"
  },
  folder= {
    default= "",
    open= ""
    }
  }
