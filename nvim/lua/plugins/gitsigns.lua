return {
  "lewis6991/gitsigns.nvim",
  lazy=false,
  keys = {
    { "<leader>gj", "<cmd>:Gitsigns next_hunk<CR>", desc = "Next git hunk" },
    { "<leader>gk", "<cmd>:Gitsigns prev_hunk<CR>", desc = "Previous git hunk" },
    { "<leader>gp", "<cmd>:Gitsigns preview_hunk<CR>", desc = "Preview git hunk" },
    { "<leader>gr", "<cmd>:Gitsigns reset_hunk<CR>", desc = "Reset git hunk" },
    { "<leader>gl", "<cmd>:Gitsigns blame<CR>", desc = "Git blame" },
  },
}
