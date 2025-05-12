return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff", require("telescope.builtin").find_files, desc = 'Find file' },
    { "<leader>bf", require("telescope.builtin").buffers, desc = 'Find buffer' },
    { "<leader>sr", require("telescope.builtin").oldfiles, desc = 'Find recent file' },
    { "<leader>sR", require("telescope.builtin").registers, desc = 'Show registers' },
    { "<leader>sk", require("telescope.builtin").keymaps, desc = 'Show keymaps' },
    { "<leader>sl", require("telescope.builtin").resume, desc = 'Resume last search' },
    { "<leader>sc", require("telescope.builtin").colorscheme, desc = 'Choose colorscheme' },
  }
}
