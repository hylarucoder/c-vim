local vim = vim
local lsp = require("nvim_lsp")
local completion = require("completion")

local on_attach_vim = function(client)
  require"lsp-status".on_attach(client)
  completion.on_attach({sorter = "alphabet", matcher = {"exact", "fuzzy"}})
end

lsp.vimls.setup {on_attach = on_attach_vim}
lsp.gopls.setup {on_attach = on_attach_vim}
lsp.jsonls.setup {on_attach = on_attach_vim}
lsp.vuels.setup {on_attach = on_attach_vim}
lsp.sqlls.setup {on_attach = on_attach_vim}
lsp.rust_analyzer.setup {on_attach = on_attach_vim}
lsp.dockerls.setup {on_attach = on_attach_vim}
-- lsp setup
lsp.sumneko_lua.setup {
  on_attach = on_attach_vim,
  settings = {
    Lua = {
      completion = {keywordSnippet = "Disable"},
      runtime = {version = "LuaJIT"},
      diagnostics = {
        enable = true,
        globals = {"vim", "Color", "c", "Group", "g", "s", "describe", "it", "before_each", "after_each"}
      }
    }
  }
}

lsp.pyls.setup {on_attach = on_attach_vim, settings = {pyls = {plugins = {pycodestyle = {enabled = false}}}}}

vim.g.completion_chain_complete_list = {
  default = {
    default = {{complete_items = {"lsp", "snippet", "tabnine"}}, {mode = "<c-p>"}, {mode = "<c-n>"}},
    comment = {{complete_items = {"buffers"}}},
    string = {{complete_items = {"path"}}}
  }
}
