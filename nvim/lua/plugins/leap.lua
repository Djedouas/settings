return {
  "ggandor/leap.nvim",
  lazy = false,
  opts = {},
  keys = {
    { "s", "<Plug>(leap)",             mode = { "n", "o", "x" }, desc = "Leap forward" },
    { "S", "<Plug>(leap-backward)",    mode = { "n", "o", "x" }, desc = "Jump backward" },
    { "ù", "<Plug>(leap-from-window)", mode = { "n", "o", "x" }, desc = "Jump other windows" } }
}
