-- Context lines above zt and below zb
vim.opt.scrolloff = 1

-- Show line numbers
vim.cmd("set number")

-- Show diagnostics on lines
vim.diagnostic.config({ virtual_text = true })
