return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master", -- will be main in the future
  lazy = false, -- nvim-treesitter does not support lazy loading
  build = ":TSUpdate", -- when nvim-treesitter is updated, we need to update its parsers

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "cpp", "python", "lua" },
      highlight = { enable = true },
    })
  end,
}
