-- NE PAS OUBLIER
-- de lancer `:Lazy load vimspector` après la première installation de Vimspector

return {
  "puremourning/vimspector",
  keys = {
    { "<leader>ds", "<Plug>VimspectorLaunch", desc = "Start", mode = "n" },
    { "<leader>dS", "<Plug>VimspectorStop", desc = "Stop", mode = "n" },
    { "<leader>do", "<Plug>VimspectorStepOver", desc = "Step over", mode = "n" },
    { "<leader>dO", "<Plug>VimspectorStepOut", desc = "Step out", mode = "n" },
    { "<leader>di", "<Plug>VimspectorStepInto", desc = "Step into", mode = "n" },
    { "<leader>dc", "<Plug>VimspectorContinue", desc = "Continue", mode = "n" },
    { "<leader>dC", "<Plug>VimspectorRunToCursor", desc = "Run to cursor", mode = "n" },
    { "<leader>dt", "<Plug>VimspectorToggleBreakpoint", desc = "Toggle breakpoint", mode = "n" },
    { "<leader>de", "<Plug>VimspectorBalloonEval", desc = "Evaluate", mode = "n" },
    { "<leader>dr", "<cmd>VimspectorReset<CR>", desc = "Reset", mode = "n" },
  },
}
