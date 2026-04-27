local filetypes = { "cpp", "python", "lua", "comment" }

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false, -- nvim-treesitter does not support lazy loading
  build = ":TSUpdate", -- when nvim-treesitter is updated, we need to update its parsers
  config = function()
    require("nvim-treesitter").install(filetypes)

    -- Highlighting enabled per-buffer (see :h treesitter-highlight)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function() vim.treesitter.start() end,
    })
  end,
}
