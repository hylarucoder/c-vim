local vim = vim
local lsp = require("nvim_lsp")
local completion = require("completion")

local function on_attach_vim(client)
end

lsp.vimls.setup {on_attach = on_attach_vim}
lsp.pyls.setup {on_attach = on_attach_vim}
lsp.gopls.setup {on_attach = on_attach_vim}
lsp.jsonls.setup {on_attach = on_attach_vim}
lsp.vuels.setup {on_attach = on_attach_vim}
lsp.sqlls.setup {on_attach = on_attach_vim}
lsp.rust_analyzer.setup {on_attach = on_attach_vim}
lsp.dockerls.setup {on_attach = on_attach_vim}
lsp.sumneko_lua.setup()
