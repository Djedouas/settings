return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = { { "<leader>lc", "<cmd>TSContext toggle<CR>", mode = { "n", "o", "x" }, { desc = "Toggle context header" } } },
  config = function()
    require("treesitter-context").setup({
      mode = "topline",
      enable = false,
    })
    vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true, sp = "Grey" })
    vim.api.nvim_set_hl(0, "TreesitterContextLineNumberBottom", { underline = true, sp = "Grey" })
  end,
}
