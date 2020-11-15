local vim = vim
vim.g.completion_chain_complete_list = {
  default = {
    default = {{complete_items = {"lsp", "snippet", "tabnine"}}, {mode = "<c-p>"}, {mode = "<c-n>"}},
    comment = {{complete_items = {"buffers"}}},
    string = {{complete_items = {"path"}}}
  }
}

vim.g.completion_enable_snippet = "UltiSnips"

require("cvim.langs.docker")
require("cvim.langs.golang")
require("cvim.langs.javascript")
require("cvim.langs.lua")
require("cvim.langs.python")
require("cvim.langs.rust")
require("cvim.langs.vim")
require("cvim.langs.vue")
require("cvim.langs.react")
