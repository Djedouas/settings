return {
  "saghen/blink.cmp",

  -- use a release tag to download pre-built binaries
  version = "1.*",

  event = { "CmdlineEnter", "InsertEnter" },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "none",
      ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      ["<C-space>"] = { "show", "hide" },
      ["<CR>"] = { "accept", "fallback" },
    },

    -- no completion in mail files
    enabled = function() return not vim.tbl_contains({ "mail" }, vim.bo.filetype) end,

    completion = {
      list = {
        selection = {
          preselect = false,
        },
      },
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

    sources = {
      providers = {
        lsp = {
          min_keyword_length = 2,
        },
        buffer = {
          min_keyword_length = 4,
        },
      },
    },
  },
}
