-- for nvim-tree
-- see https://github.com/nvim-tree/nvim-tree.lua?tab=readme-ov-file#setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("config.lazy")
require("config.mappings")
require("config.misc")
require("config.lsp")

vim.cmd("colorscheme carbonfox")
