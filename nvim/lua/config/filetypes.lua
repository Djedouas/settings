-- Indentations
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "lua" },
  callback = function()
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
  end,
})
