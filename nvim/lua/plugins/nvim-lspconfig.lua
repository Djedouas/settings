-- Native LSP neovim configuration
vim.lsp.enable("ruff")
vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")

vim.lsp.config("lua_ls", {
  on_init = function(client)
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

-- nvim-lspconfig plugin
return {
  "neovim/nvim-lspconfig",
  lazy = false,
}
