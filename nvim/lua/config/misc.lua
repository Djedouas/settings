-- Context lines above zt and below zb
vim.opt.scrolloff = 1

-- Show line numbers
vim.opt.number = true

-- Show diagnostics on lines
vim.diagnostic.config({ virtual_text = true, underline = true })

-- Persistent undo
vim.opt.undofile = true

-- Folds
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"
vim.opt.foldlevel = 200
