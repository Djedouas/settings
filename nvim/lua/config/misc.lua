-- Context lines above zt and below zb
vim.opt.scrolloff = 1

-- Show line numbers
vim.opt.number = true

-- Show diagnostics on current line
vim.diagnostic.config({
  virtual_text = { current_line = true },
  underline = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '💡',
    }
  }
})

-- Persistent undo
vim.opt.undofile = true

-- Folds
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"
vim.opt.foldlevel = 200
