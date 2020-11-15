local lsp = require("nvim_lsp")
local utils = require("cvim.langs.utils")
local on_attach_vim = utils.on_attach_vim

require("nlua.lsp.nvim").setup(require("nvim_lsp"), {
  on_attach = on_attach_vim,

  globals = {"vim", "Color", "c", "Group", "g", "s", "describe", "it", "before_each", "after_each"}
})
