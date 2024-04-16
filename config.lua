-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h10.5"
lvim.colorscheme = "carbonfox"

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
  { name = "ruff" },
  { name = "isort" },
  { name = "astyle", args = { "--options=/home/jacky/dev/QGIS/scripts/astyle.options" } }
}

-- when 2 servers with different offset_encoding are attached on a buffer we get a warning
-- so here I force clangd to use utf-16 which is apparently the value used by null-ls
-- (use case: cpp file buffer with astyle with null-ls and clang with lsp)
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lvim.lsp.manager").setup("clangd", { capabilities = capabilities })

-- linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "pylint", args = { "--init-hook", "import sys; sys.path.append('" .. (vim.env.VIRTUAL_ENV or "") .. "/lib/python3.10/site-packages/')" } }
  { name = "ruff" }
  -- { name = "mypy" },
}

-- Zeal QGIS and Qt docset
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.py" }, command = "Docset qgis,qt5,python", })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.cpp", "*.h" }, command = "Docset qgis,qt5", })

-- custom smooth scrolling
local t    = {}
t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '150', 'quintic' } }
t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '150', 'quintic' } }
t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450' } }
t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450' } }
t['<C-y>'] = { 'scroll', { '-0.40', 'false', '100' } }
t['<C-e>'] = { 'scroll', { '0.40', 'false', '100' } }
t['zt']    = { 'zt', { '80', 'quintic' } }
t['zz']    = { 'zz', { '80', 'quintic' } }
t['zb']    = { 'zb', { '80', 'quintic' } }
require('neoscroll.config').set_mappings(t)

-- no indentation marker
lvim.builtin.indentlines.active = false

-- cursor occurrence matching
lvim.builtin.illuminate.options.delay = 1000
lvim.builtin.illuminate.options.min_count_to_highlight = 2

lvim.plugins =
{
  { "chrisgrieser/nvim-spider" },      -- w, e, b camelCase aware
  -- { "askfiy/visual_studio_code" },     -- colorscheme
  { "jeetsukumaran/vim-pythonsense" }, -- python textobjects
  { "wellle/targets.vim" },            -- plenty of textobjects
  { "KabbAmine/zeavim.vim" },          -- Zeal
  { "puremourning/vimspector" },       -- Vimspector

  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        groups = {
          all = {
            MatchParen = { bg = "#666666" },
            LspReferenceText = { style = "underline" } -- for illuminate plugin
          }
        },
        options = {
          styles = {
            comments = 'italic'
          },
          colorblind = {
            enable = true,
            severity = {
              protan = 0.8,
              deutan = 0.2,
              tritan = 0.0,
            },
          },
        }
      })
    end
  },

  -- tagbar
  {
    "hedyhli/outline.nvim",
    config = function()
      local opts = {
        symbols        = {
          filter = {
            python = { "Property", "Module", exclude = true },
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

-- UFO settings for folds
vim.opt.foldcolumn = '0' -- '0' is not bad
vim.opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
lvim.keys.normal_mode['zR'] = require('ufo').openAllFolds
lvim.keys.normal_mode['zM'] = require('ufo').closeAllFolds

-- Context lines above zt and below zb
vim.opt.scrolloff = 1

-- nvim-spider for camel case motion
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- Custom snippet
lvim.builtin.which_key.mappings["P"] = { "Oprint('########')<C-[>joprint('########')<C-[>k0w", "Python emphasize print" }
lvim.builtin.which_key.mappings["S"] = { 'F"vF"cQStringLitteral( " )', "QStringLiteral" }

-- Toggle wrap
vim.keymap.set({ "n", "o", "x" }, "²", "<cmd>set wrap!<CR>", { desc = "Toggle word wrap" })

-- Toggle outline
lvim.builtin.which_key.mappings["t"] = { "<cmd>Outline<CR>", "Outline" }

-- Vimspector keymaps
lvim.builtin.which_key.mappings["d"] = {
  name = "Vimspector",
  s = { "<Plug>VimspectorLaunch", "Start" },
  S = { "<Plug>VimspectorStop", "Stop" },
  o = { "<Plug>VimspectorStepOver", "Step over" },
  O = { "<Plug>VimspectorStepOut", "Step out" },
  i = { "<Plug>VimspectorStepInto", "Step into" },
  c = { "<Plug>VimspectorContinue", "Continue" },
  C = { "<Plug>VimspectorRunToCursor", "Run to cursor" },
  t = { "<Plug>VimspectorToggleBreakpoint", "Toggle breakpoint" },
  e = { "<Plug>VimspectorBalloonEval", "Evaluate" },
  r = { "<Plug>VimspectorReset", "Reset" },
}

-- Windows width keymaps
lvim.builtin.which_key.mappings["<"] = { "<C-w>30<", "Lower window width" }
lvim.builtin.which_key.mappings[">"] = { "<C-w>30>", "Raise window width" }

-- Switch buffer
lvim.builtin.which_key.mappings["<Tab>"] = { "<C-^>", "Go to last buffer" }

-- Close tab
lvim.builtin.which_key.mappings["Q"] = { "<cmd>tabclose<CR>", "Close tab" }

-- Leap
vim.keymap.set({ "n", "o", "x" }, "s", "<Plug>(leap-forward)", { desc = "Jump forward" })
vim.keymap.set({ "n", "o", "x" }, "S", "<Plug>(leap-backward)", { desc = "Jump backward" })
vim.keymap.set({ "n", "o", "x" }, "ù", "<Plug>(leap-from-window)", { desc = "Jump other windows" })
