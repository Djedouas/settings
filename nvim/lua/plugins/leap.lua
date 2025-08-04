return {
  "ggandor/leap.nvim",
  event = "BufEnter",
  opts = {},
  keys = {
    { "s", "<Plug>(leap)", mode = { "n", "o", "x" }, desc = "Leap forward" },
    { "S", "<Plug>(leap-backward)", mode = { "n", "o", "x" }, desc = "Leap backward" },
    { "ù", "<Plug>(leap-from-window)", mode = { "n", "o", "x" }, desc = "Leap other windows" },
  },
}
