vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.py" }, command = "Docset qgis,qt6,python" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.cpp", "*.h" }, command = "Docset cpp,qgis,qt6" })

return {
  "KabbAmine/zeavim.vim",

  -- event = {
  --   "BufAdd *.cpp",
  --   "BufAdd *.py",
  --   "BufAdd *.h",
  -- },

  -- lazy false because events above does not work
  -- when opening a file directly from the command line
  -- which seems to be a bug
  lazy = false,
}
