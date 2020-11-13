local vim = vim
local cvim = {}

function cvim.bootstrap()
  require("cvim.basic")
  require("cvim.plugins")
  require("cvim.keymaps")
  require("cvim.layers")
end
return cvim
