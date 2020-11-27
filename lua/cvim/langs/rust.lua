local lsp = require("lspconfig")
local utils = require("cvim.langs.utils")
local on_attach_vim = utils.on_attach_vim
lsp.rust_analyzer.setup {on_attach = on_attach_vim}
