local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "l", api.node.open.edit, { buffer = bufnr, noremap = true, silent = true, nowait = true })
  vim.keymap.set("n", "h", api.node.navigate.parent_close, { buffer = bufnr, noremap = true, silent = true, nowait = true })
  vim.keymap.set("n", "C", api.tree.change_root_to_node, { buffer = bufnr, noremap = true, silent = true, nowait = true })
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    on_attach = my_on_attach,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
  },
  keys = {
    { "<leader>e", ":NvimTreeToggle<CR>", desc = "Explorer" },
  },
}
