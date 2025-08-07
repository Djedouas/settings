-- Native LSP neovim configuration
vim.lsp.enable("ruff")
vim.lsp.enable("pyright")
vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("ltex_plus")

-- Configuration for lua_ls
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

-- Configuration for ltex_plus
local function toggle_language()
  local ltex_settings = vim.lsp.get_clients({ name = "ltex_plus" })[1].config.settings
  if not ltex_settings then return end
  local language = ltex_settings.ltex.language
  if language == "fr" then
    ltex_settings.ltex.language = "en-US"
  else
    ltex_settings.ltex.language = "fr"
  end
  vim.lsp.buf_notify(0, "workspace/didChangeConfiguration", { settings = ltex_settings })
end
vim.keymap.set("n", "<leader>lm", toggle_language, { desc = "Toggle language" })

-- Toggle inlay hints
vim.keymap.set(
  "n",
  "<leader>lh",
  function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
  { desc = "Toggle inlay hints" }
)

-- nvim-lspconfig plugin
return {
  "neovim/nvim-lspconfig",
  lazy = false,
}
