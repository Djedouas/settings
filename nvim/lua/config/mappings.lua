-- Move cursor windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<leader><tab>", "<C-^>", { desc = "Go to last buffer" })

-- Windows width keymaps
vim.keymap.set("n", "<leader><", "<C-w>30<", { desc = "Lower window width" })
vim.keymap.set("n", "<leader>>", "<C-w>30>", { desc = "Larger window width" })

-- Toggle wrap
vim.keymap.set({ "n", "o", "x" }, "²", "<cmd>set wrap!<CR>", { desc = "Toggle word wrap" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", "<cmd>:bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>:bprevious<CR>", { desc = "Previous buffer" })
