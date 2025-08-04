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
vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })

-- Others
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "No highlight" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save buffer" })
vim.keymap.set({ "n", "o", "x" }, "²", "set wrap!<CR>", { desc = "Toggle word wrap" })

vim.keymap.set("x", "<M-j>", ":move '>+1<CR>gv-gv", { desc = "Move lines down" })
vim.keymap.set("n", "<M-j>", ":move .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("x", "<M-k>", ":move '<-2<CR>gv-gv", { desc = "Move lines up" })
vim.keymap.set("n", "<M-k>", ":move .-2<CR>==", { desc = "Move line up" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
