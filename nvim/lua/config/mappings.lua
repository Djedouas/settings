-- Move between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Windows resize keymaps
vim.keymap.set("n", "<leader><", "<C-w>30<", { desc = "Lower window width" })
vim.keymap.set("n", "<leader>>", "<C-w>30>", { desc = "Larger window width" })
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Lower window height" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Larger window height" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bb", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>c", ":bdelete<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader><tab>", "<C-^>", { desc = "Go to last buffer" })

-- Diagnostics navigation
vim.keymap.set("n", "<leader>lj", "]d", { desc = "Go to next diagnostic", remap = true })
vim.keymap.set("n", "<leader>lk", "[d", { desc = "Go to previous diagnostic", remap = true })

-- Comment/Uncomment
vim.keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comment", remap = true })
vim.keymap.set("x", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Custom snippets
vim.keymap.set("n", "<leader>P", "Oprint('########')<C-[>joprint('########')<C-[>k0w", { desc = "Python emphasize print" })
vim.keymap.set("n", "<leader>S", 'F"vF"cQStringLiteral( " )', { desc = "QStringLiteral" })
vim.keymap.set("n", "<leader>C", '0f"v$F;hcstd::cout << " << std::endl$', { desc = "std::cout" })

-- Move lines with Alt
vim.keymap.set("x", "<M-j>", ":move '>+1<CR>gv-gv", { desc = "Move lines down" })
vim.keymap.set("n", "<M-j>", ":move .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("x", "<M-k>", ":move '<-2<CR>gv-gv", { desc = "Move lines up" })
vim.keymap.set("n", "<M-k>", ":move .-2<CR>==", { desc = "Move line up" })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })

-- Qt lldb formatting
vim.keymap.set(
  { "n", "o", "x" },
  "°",
  "icommand script import /home/jacky/.settings/lldb-qt-formatters/lldbbridge.py<CR>",
  { desc = "insert command for lldb Qt formatter" }
)

-- Togle diagnostics
vim.keymap.set("n", "<leader>lt", function()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.diagnostic.enable(false)
  else
    vim.g.diagnostics_visible = true
    vim.diagnostic.enable()
  end
end, { desc = "Toggle diagnostics" })

-- Does the cursor file exists?
vim.keymap.set(
  "n",
  "gG",
  ":echo filereadable(expand('<cfile>')) ? 'file exists' : 'file does not exist'<CR>",
  { desc = "Check file existance" }
)

-- Others
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "No highlight" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save buffer" })
vim.keymap.set({ "n", "o", "x" }, "²", ":set wrap!<CR>", { desc = "Toggle word wrap" })
