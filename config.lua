-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h10.5"
lvim.colorscheme = "carbonfox"

-- vim.g.python3_host_prog = "/home/jacky/.venvs/nvim/bin/python"

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  { name = "isort" },
}

-- linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "pylint", args = { "--init-hook", "import sys; sys.path += ['" .. (vim.env.VIRTUAL_ENV or "") .. "/lib/python3.10/site-packages/', '/usr/lib/python3/dist-packages/']" } },
  { name = "mypy" },
}

-- custom smooth scrolling
local t                = {}
t['<C-u>']             = { 'scroll', { '-vim.wo.scroll', 'true', '150', 'quintic' } }
t['<C-d>']             = { 'scroll', { 'vim.wo.scroll', 'true', '150', 'quintic' } }
t['<C-b>']             = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450' } }
t['<C-f>']             = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450' } }
t['<C-y>']             = { 'scroll', { '-0.40', 'false', '100' } }
t['<C-e>']             = { 'scroll', { '0.40', 'false', '100' } }
t['zt']                = { 'zt', { '80', 'quintic' } }
t['zz']                = { 'zz', { '80', 'quintic' } }
t['zb']                = { 'zb', { '80', 'quintic' } }
local has_neoscroll, _ = pcall(require, 'neoscroll')
if has_neoscroll then
  require('neoscroll.config').set_mappings(t)
end

-- no indentation marker
lvim.builtin.indentlines.active = false

-- cursor occurrence matching
lvim.builtin.illuminate.options.delay = 1000
lvim.builtin.illuminate.options.min_count_to_highlight = 2

lvim.plugins =
{
  { "chrisgrieser/nvim-spider" },      -- w, e, b camelCase aware

  -- tagbar
  {
    "hedyhli/outline.nvim",
    config = function()
      local opts = {
        symbols        = {
          filter = {
            python = { "Property", "Module", "Variable", exclude = true },
            cpp = false
          }
        },
        outline_items  = {
          show_symbol_details = false,
        },
        keymaps        = { close = {} },
        outline_window = { focus_on_open = false }
      }
      require("outline").setup(opts)
    end,
  },

  -- jump
  {
    "ggandor/leap.nvim",
  },

  -- smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = t,
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = false,            -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      })
    end
  },
}

-- Context lines above zt and below zb
vim.opt.scrolloff = 1

-- nvim-spider for camel case motion
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- Custom snippet
lvim.builtin.which_key.mappings["P"] = { "Oprint('########')<C-[>joprint('########')<C-[>k0w", "Python emphasize print" }

-- Toggle wrap
vim.keymap.set({ "n", "o", "x" }, "²", "<cmd>set wrap!<CR>", { desc = "Toggle word wrap" })

-- Toggle outline
lvim.builtin.which_key.mappings["t"] = { "<cmd>Outline<CR>", "Outline" }

-- Switch buffer
lvim.builtin.which_key.mappings["<Tab>"] = { "<C-^>", "Go to last buffer" }

-- Close tab
lvim.builtin.which_key.mappings["Q"] = { "<cmd>tabclose<CR>", "Close tab" }

-- Leap
vim.keymap.set({ "n", "o", "x" }, "s", "<Plug>(leap-forward)", { desc = "Jump forward" })
vim.keymap.set({ "n", "o", "x" }, "S", "<Plug>(leap-backward)", { desc = "Jump backward" })
vim.keymap.set({ "n", "o", "x" }, "ù", "<Plug>(leap-from-window)", { desc = "Jump other windows" })

-- Togle diagnostics
vim.g.diagnostics_visible = true
local function toggle_diagnostics()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_visible = true
    vim.diagnostic.enable()
  end
end
lvim.builtin.which_key.mappings["lT"] = { toggle_diagnostics, "Toggle diagnostics" }
