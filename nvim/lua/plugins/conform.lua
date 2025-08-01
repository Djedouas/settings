return {
  "stevearc/conform.nvim",
  event = "BufEnter", -- lazy load on event
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>lf",
      function() require("conform").format({ async = true }) end,
      mode = { "n" },
      desc = "Format buffer",
    },
  },
  opts = {
    -- Define your formatters
    log_level = vim.log.levels.DEBUG,
    formatters_by_ft = {
      python = { "isort", "black" },
      cpp = { "clang-format", "astyle" },
      lua = { "stylua" },
    },
    -- Set default options
    default_format_opts = {
      -- LSP formatting is used when no other formatters are available
      lsp_format = "fallback",
    },
    -- Customize formatters
    formatters = {
      astyle = {
        prepend_args = { "--options=/home/jacky/dev/QGIS/scripts/astyle.options" },
      },
      stylua = {
        args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
          "--column-width",
          "130",
          "--collapse-simple-statement",
          "Always",
          "--stdin-filepath",
          "$FILENAME",
          "-",
        },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
