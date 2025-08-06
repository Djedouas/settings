return {
  "saghen/blink.cmp",

  -- use a release tag to download pre-built binaries
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
    },

    completion = {
      ghost_text = { enabled = true },
      menu = {
        draw = {
          columns = {
            { "kind", "kind_icon", gap = 1 },
            { "label", "label_description", gap = 1 },
            { "source_name" },
          },
        },
      },
    },
  },

  -- opts_extend = { "sources.default" },
}
