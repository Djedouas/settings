local function telescope()
  return require("telescope.builtin")
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>f", telescope().find_files, desc = "Find file" },
    { "<leader>bf", telescope().buffers, desc = "Find buffer" },
    { "<leader>sr", telescope().oldfiles, desc = "Find recent file" },
    { "<leader>sk", telescope().keymaps, desc = "Show keymaps" },
    { "<leader>sl", telescope().resume, desc = "Resume last search" },
    { "<leader>sc", telescope().colorscheme, desc = "Choose colorscheme" },
    { "<leader>st", telescope().live_grep, desc = "Find text" },
    { "<leader>ls", telescope().lsp_document_symbols, desc = "Find document symbol" },
    { "<leader>lS", telescope().lsp_dynamic_workspace_symbols, desc = "Find workspace symbol" },
  },
}
