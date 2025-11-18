-- Indentations
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "lua" },
  callback = function()
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
  end,
})

-- Start screen
if vim.fn.argc() == 0 then
  vim.api.nvim_create_autocmd("BufEnter", {
    once = true,
    callback = function()
      local buf = vim.api.nvim_get_current_buf()

      -- Only apply this logic if the buffer is completely empty and unnamed
      if vim.api.nvim_buf_get_name(buf) == "" and vim.api.nvim_buf_line_count(buf) == 1 then
        -- Create a temporary keymap: "r" opens Telescope oldfiles
        vim.keymap.set("n", "r", require("telescope.builtin").oldfiles, { buffer = buf, silent = true })

        -- Remove the keymap as soon as the user starts typing something
        vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
          buffer = buf,
          once = true,
          callback = function()
            -- Check if the buffer actually has some content
            local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
            local has_content = #lines > 1 or (lines[1] ~= "")
            if has_content then
              -- Safely delete the keymap without errors
              pcall(vim.keymap.del, "n", "r", { buffer = buf })
            end
          end,
        })
      end
    end,
  })
end
