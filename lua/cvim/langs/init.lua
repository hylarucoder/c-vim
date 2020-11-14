local vim = vim
local lsp_status = require("lsp-status")
local lsp = require("nvim_lsp")
local completion = require("completion")

vim.g.completion_enable_snippet = "UltiSnips"

lsp_status.register_progress()

local function on_attach_vim(client)
  completion.on_attach(client)
  lsp_status.on_attach(client)
end

local function capabilities_vim(client)
  lsp_status.capabilities(client)
end

lsp.vimls.setup {on_attach = on_attach_vim, capabilities = capabilities_vim}
lsp.pyls.setup {on_attach = on_attach_vim, capabilities = capabilities_vim}
lsp.gopls.setup {on_attach = on_attach_vim, capabilities = capabilities_vim}
lsp.jsonls.setup {on_attach = on_attach_vim, capabilities = capabilities_vim}
lsp.vuels.setup {on_attach = on_attach_vim, capabilities = capabilities_vim}
lsp.sqlls.setup {on_attach = on_attach_vim, capabilities = capabilities_vim}
lsp.rust_analyzer.setup {on_attach = on_attach_vim, capabilities = capabilities_vim}
lsp.dockerls.setup {on_attach = on_attach_vim, capabilities = capabilities_vim}

require("nvim_lsp").sumneko_lua.setup()

local function custom_nvim_lspconfig_attach(client)
end

require("nlua.lsp.nvim").setup(require("nvim_lsp"), {
  on_attach = custom_nvim_lspconfig_attach,

  -- Include globals you want to tell the LSP are real :)
  globals = {
    -- Colorbuddy
    "Color",
    "c",
    "Group",
    "g",
    "s"
  }
})
