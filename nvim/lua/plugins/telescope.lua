local function telescope()
  return require("telescope.builtin")
end

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff", telescope().find_files, desc = 'Find file' },
    { "<leader>bf", telescope().buffers, desc = 'Find buffer' },
    { "<leader>sr", telescope().oldfiles, desc = 'Find recent file' },
    { "<leader>sR", telescope().registers, desc = 'Show registers' },
    { "<leader>sk", telescope().keymaps, desc = 'Show keymaps' },
    { "<leader>sl", telescope().resume, desc = 'Resume last search' },
    { "<leader>sc", telescope().colorscheme, desc = 'Choose colorscheme' },
  }
}
