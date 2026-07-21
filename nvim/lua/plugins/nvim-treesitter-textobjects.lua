local function call_textobject(capture_group, context)
  return require("nvim-treesitter-textobjects.select").select_textobject(capture_group, context or "textobjects")
end

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

        -- You can choose the select mode (default is charwise 'v')
        -- (charwise 'v', linewise 'V', or blockwise '<c-v>')
        selection_modes = "V",
      },
    })
  end,

  keys = {
    -- You can use the capture groups defined in textobjects.scm
    { "af", function() call_textobject("@function.outer") end, mode = { "x", "o" } },
    { "if", function() call_textobject("@function.inner") end, mode = { "x", "o" } },
    { "aC", function() call_textobject("@class.outer") end, mode = { "x", "o" } },
    { "iC", function() call_textobject("@class.inner") end, mode = { "x", "o" } },
    { "ai", function() call_textobject("@conditional.outer") end, mode = { "x", "o" } },
    { "ii", function() call_textobject("@conditional.inner") end, mode = { "x", "o" } },
    { "ac", function() call_textobject("@comment.outer") end, mode = { "x", "o" } },
    { "ic", function() call_textobject("@comment.inner") end, mode = { "x", "o" } },
    { "al", function() call_textobject("@loop.outer") end, mode = { "x", "o" } },
    { "il", function() call_textobject("@loop.inner") end, mode = { "x", "o" } },
    { "ad", function() call_textobject("@string.documentation", "highlights") end, mode = { "x", "o" } },
  },
}
