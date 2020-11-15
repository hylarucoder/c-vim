local lsp = require("nvim_lsp")
local utils = require("cvim.langs.utils")
local on_attach_vim = utils.on_attach_vim
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
