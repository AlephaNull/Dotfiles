require('base')
require('highlights')
require('maps')
require ('plugins')
local has = function(x)
  return vim.fn.has(x) == 1
end
vim.cmd[[colorscheme tokyonight]]
require('Comment').setup()
require("bufferline").setup{}

require("luasnip.loaders.from_vscode").lazy_load()
