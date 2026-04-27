return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugins_maps = true
  end,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter-textobjects").setup({
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["aC"] = "@class.outer",
          ["iC"] = "@class.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["ac"] = "@comment.outer",
          ["ic"] = "@comment.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["ad"] = { query = "@string.documentation", query_group = "highlights" },
        },

        -- You can choose the select mode (default is charwise 'v')
        -- (charwise 'v', linewise 'V', or blockwise '<c-v>')
        selection_modes = "V",
      },
    })
  end,
}
