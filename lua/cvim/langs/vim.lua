local lsp = require("nvim_lsp")
local utils = require("cvim.langs.utils")
local on_attach_vim = utils.on_attach_vim
lsp.vimls.setup {on_attach = on_attach_vim}
