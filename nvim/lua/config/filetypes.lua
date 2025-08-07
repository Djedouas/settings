-- Indentations
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"cpp", "lua"},
  callback = function()
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
  end,
})

-- Start screen
if vim.fn.argc() == 0 then
  vim.api.nvim_create_autocmd("BufEnter", {
    once = true,
    callback = function() vim.keymap.set("n", "r", require("telescope.builtin").oldfiles, { buffer = true, silent = true }) end,
  })
end
