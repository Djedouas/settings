return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter", -- lazy load on event
  keys = {
    { "<leader>gj", ":Gitsigns next_hunk<CR>", desc = "Next git hunk" },
    { "<leader>gk", ":Gitsigns prev_hunk<CR>", desc = "Previous git hunk" },
    { "<leader>gp", ":Gitsigns preview_hunk<CR>", desc = "Preview git hunk" },
    { "<leader>gr", ":Gitsigns reset_hunk<CR>", desc = "Reset git hunk" },
    { "<leader>gl", ":Gitsigns blame<CR>", desc = "Git blame" },
  },
}
