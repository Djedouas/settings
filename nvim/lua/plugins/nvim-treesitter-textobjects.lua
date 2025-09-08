return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,

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
      },
    })
  end,
}
