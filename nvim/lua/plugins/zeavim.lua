vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.py" }, command = "Docset qgis,qt5,python" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.cpp", "*.h" }, command = "Docset cpp,qgis,qt5" })

return {
  "KabbAmine/zeavim.vim",
  event = {
    "BufAdd *.cpp",
    "BufAdd *.py",
    "BufAdd *.h",
  },
}
