local lsp = require("lspconfig")
local utils = require("cvim.langs.utils")
local on_attach_vim = utils.on_attach_vim
lsp.pyls.setup {
  on_attach = on_attach_vim,
  settings = {pyls = {plugins = {pycodestyle = {enabled = false}, pylint = {enabled = false}}}}
}
