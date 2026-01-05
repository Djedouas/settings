-- Linters by filetype, with optional command if name differs
local linters = {
  python = { "flake8", "pylint", "mypy" },
}

return {
  "mfussenegger/nvim-lint",
  lazy = false,
  config = function()
    -- Configure pylint to add pylintrc if it exists
    local rcfile_path = vim.fn.getcwd() .. "/linters/pylintrc"
    local pylint = require("lint").linters.pylint
    if vim.loop.fs_stat(rcfile_path) then table.insert(pylint.args, "--rcfile=" .. rcfile_path) end

    -- Lint files on write when the specified linters are found
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
      pattern = { "*.py", "*.cpp" },

      callback = function()
        local ft_linters = linters[vim.bo.filetype]
        if not ft_linters then return end
        for _, linter in ipairs(ft_linters) do
          -- If it is executable, lint at the end of the current event loop
          -- (so that the current working directory is correctly set by project.nvim)
          if vim.fn.executable(require("lint").linters[linter].cmd) == 1 then
            vim.schedule(function() require("lint").try_lint(linter) end)
          end
        end
      end,
    })
  end,
}
