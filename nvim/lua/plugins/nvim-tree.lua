local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")
  vim.keymap.set("n", "l", api.node.open.edit,
    { buffer = bufnr, noremap = true, silent = true, nowait = true })
  vim.keymap.set("n", "h", api.node.navigate.parent_close,
    { buffer = bufnr, noremap = true, silent = true, nowait = true })
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = { on_attach = my_on_attach },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
  }
}
