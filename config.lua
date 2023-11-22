-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h10.5"
lvim.colorscheme = "visual_studio_code"
lvim.builtin.lualine.options.theme = 'onedark'

vim.g.python3_host_prog = "/home/jacky/.venvs/nvim/bin/python"

-- add `pyright` to `skipped_servers` list
-- remove `jedi_language_server` from `skipped_servers` list
lvim.lsp.automatic_servers_installation = false
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "jedi_language_server"
end, lvim.lsp.automatic_configuration.skipped_servers)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  { name = "isort" },
}

-- linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "pylint" , args = {"--init-hook", "import sys; sys.path.append('" .. (vim.env.VIRTUAL_ENV or "") .. "/lib/python3.10/site-packages/')"} }
  -- { name = "mypy" },
}

-- Zeal QGIS and Qt docset
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.py" }, command = "Docset qgis,qt5,python", })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.cpp", "*.h" }, command = "Docset qgis,qt5", })

-- Colors
lvim.autocommands = {
  {
    { "ColorScheme" },
    {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "@type.cpp", { fg = "#ffffff", underline = false, bold = false })
        vim.api.nvim_set_hl(0, "@type.builtin.cpp", { fg = "#ffffff", underline = false, bold = false })
        vim.api.nvim_set_hl(0, "MatchParen", { bg = "#666666", bold = true })
      end,
    },
  },
}

-- custom smooth scrolling
local t    = {}
t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '150', 'quintic' } }
t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '150', 'quintic' } }
t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450' } }
t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450' } }
t['<C-y>'] = { 'scroll', { '-0.10', 'false', '100' } }
t['<C-e>'] = { 'scroll', { '0.10', 'false', '100' } }
t['zt']    = { 'zt', { '80', 'quintic' } }
t['zz']    = { 'zz', { '80', 'quintic' } }
t['zb']    = { 'zb', { '80', 'quintic' } }
require('neoscroll.config').set_mappings(t)

-- no indentation marker
lvim.builtin.indentlines.active = false

-- cursor occurrence matching
lvim.builtin.illuminate.options.delay = 2000
lvim.builtin.illuminate.options.min_count_to_highlight = 2

lvim.plugins =
{
  { "chrisgrieser/nvim-spider" },      -- w, e, b camelCase aware
  { "askfiy/visual_studio_code" },     -- colorscheme
  { "jeetsukumaran/vim-pythonsense" }, -- python textobjects
  { "wellle/targets.vim" },            -- plenty of textobjects
  { "KabbAmine/zeavim.vim" },          -- Zeal
  { "puremourning/vimspector" },       -- Vimspector

  -- tagbar
  {
    "hedyhli/outline.nvim",
    config = function()
      local opts = {
        symbol_blacklist = { "Variable", "Module" },
        highlight_hovered_item = false,
        keymaps = { close = {} }
      }
      require("outline").setup(opts)
    end,
  },

  -- jump
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },

  -- folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter' }
        end
      })
    end,
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

-- nvim-spider for camel case motion
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- hop mappings
lvim.builtin.which_key.mappings["j"] = { "<cmd>HopLineMW<CR>", "Jump to line" }
lvim.builtin.which_key.mappings["k"] = { "<cmd>HopWord<CR>", "Jump to word" }

-- close tab
lvim.builtin.which_key.mappings["Q"] = { "<cmd>tabclose<CR>", "Close tab" }

-- toggle wrap
vim.keymap.set({ "n", "o", "x" }, "²", "<cmd>set wrap!<CR>", { desc = "Toggle word wrap" })

-- Symbols map
lvim.builtin.which_key.mappings["t"] = { "<cmd>Outline<CR>", "Outline" }

-- UFO settings for folds
vim.opt.foldcolumn = '0' -- '0' is not bad
vim.opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
lvim.keys.normal_mode['zR'] = require('ufo').openAllFolds
lvim.keys.normal_mode['zM'] = require('ufo').closeAllFolds

-- Context lines above zt and below zb
vim.opt.scrolloff = 1

-- Vimspector keymaps
lvim.builtin.which_key.mappings["d"] = {
  name = "Vimspector",
  s = { "<cmd>call vimspector#Launch()<cr>", "Start"},
  o = { "<cmd>call vimspector#StepOver()<cr>", "Step over"},
  O = { "<cmd>call vimspector#StepOut()<cr>", "Step out"},
  c = { "<cmd>call vimspector#Continue()<cr>", "Continue"},
  C = { "<cmd>call vimspector#RunToCursor()<cr>", "Run to cursor"},
  t = { "<cmd>call vimspector#ToggleBreakpoint()<cr>", "Toggle breakpoint"},
  e = { "<cmd>call vimspector#ShowEvalBalloon()<cr>", "Evaluate"},
  r = { "<cmd>call vimspector#Reset()<cr>", "Reset"},
}
