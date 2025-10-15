-- Linters by filetype, with optional command if name differs
local linters = {
  python = {
    { name = "flake8" },
    { name = "pylint" },
    { name = "mypy" },
  },
  cpp = {
    -- { name = "clangtidy", cmd = "clang-tidy" },
    -- { name = "clazy" },
  },
}

return {
  "mfussenegger/nvim-lint",
  lazy = false,
  config = function()
    -- Lint files on write when the specified linters are found
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
      pattern = { "*.py", "*.cpp" },

      callback = function()
        local ft_linters = linters[vim.bo.filetype]
        if not ft_linters then return end
        for _, linter in ipairs(ft_linters) do
          -- Get executable name (cmd prevent on name)
          local cmd = linter.cmd or linter.name

          -- If it is executable, lint at the end of the current event loop
          -- (so that the current working directory is correctly set by project.nvim)
          if vim.fn.executable(cmd) == 1 then vim.schedule(function() require("lint").try_lint(linter.name) end) end
        end
      end,
    })
  end,
}
