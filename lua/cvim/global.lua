local global = {}
local home    = os.getenv("HOME")

function global:load_variables()
  self.is_mac     = jit.os == 'OSX'
  self.is_linux   = jit.os == 'Linux'
  self.is_windows = jit.os == 'Windows'
  self.vim_path    = home .. '/.config/nvim'
  self.cache_dir   = home .. '/.cache/vim/'
  self.home = home
end

global:load_variables()

return global
