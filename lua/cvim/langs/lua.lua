local lsp = require("lspconfig")
local utils = require("cvim.langs.utils")
local on_attach_vim = utils.on_attach_vim

-- require("nlua.lsp.nvim").setup(require("lspconfig"), {
--   on_attach = on_attach_vim,
-- 
--   globals = {"vim", "Color", "c", "Group", "g", "s", "describe", "it", "before_each", "after_each"}
-- })
