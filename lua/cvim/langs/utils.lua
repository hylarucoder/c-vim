local completion = require("completion")
local utils = {}

function utils.on_attach_vim(client)
  require"lsp-status".on_attach(client)
  completion.on_attach({sorter = "alphabet", matcher = {"exact", "fuzzy"}})
end
return utils
