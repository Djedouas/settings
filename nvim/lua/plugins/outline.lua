return {
  "hedyhli/outline.nvim",
  opts = {
    symbols = {
      filter = {
        python = { "Property", "Module", "Variable", exclude = true },
        cpp = false,
      },
    },
    symbol_folding = {
      auto_unfold = { only = true },
      autofold_depth = 2,
    },
    outline_items = {
      show_symbol_details = false,
    },
    keymaps = { close = {} },
    outline_window = { focus_on_open = false },
  },
  keys = {
    { "<leader>t", "<cmd>Outline<cr>", desc = "Outline" },
  },
}
