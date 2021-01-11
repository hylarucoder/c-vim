local manager = require("cvim.plugins.manager")
manager.init()

vim.g.rainbow_active = 1 -- "set to 0 if you want to enable it later via :RainbowToggle

-- vim.g["vista#renderer#enable_icon"] = 1
vim.g["vista#renderer#ctags"] = "default"

vim.g["vista_executive_for"] = {python = "ctags"}

vim.g.black_virtualenv = "~/.config/black"

require("cvim.plugins.ale")
require("cvim.plugins.quickui")
require("cvim.plugins.signify")
require("cvim.plugins.startify")
