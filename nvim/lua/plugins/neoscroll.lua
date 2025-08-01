return {
  "karb94/neoscroll.nvim",
  opts = {
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {}, -- mappings below for custom durations
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = false, -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  },
  keys = {
    { "<C-u>", function() require("neoscroll").ctrl_u({ duration = 150 }) end, mode = { "n", "v" } },
    { "<C-d>", function() require("neoscroll").ctrl_d({ duration = 150 }) end, mode = { "n", "v" } },
    { "<C-b>", function() require("neoscroll").ctrl_b({ duration = 450 }) end, mode = { "n", "v" } },
    { "<C-f>", function() require("neoscroll").ctrl_f({ duration = 450 }) end, mode = { "n", "v" } },
    { "<C-y>", function() require("neoscroll").scroll(-0.1, { move_cursor = false, duration = 100 }) end, mode = { "n", "v" } },
    { "<C-e>", function() require("neoscroll").scroll(0.1, { move_cursor = false, duration = 100 }) end, mode = { "n", "v" } },
    { "zt", function() require("neoscroll").zt({ half_win_duration = 80 }) end, mode = { "n", "v" } },
    { "zz", function() require("neoscroll").zz({ half_win_duration = 80 }) end, mode = { "n", "v" } },
    { "zb", function() require("neoscroll").zb({ half_win_duration = 80 }) end, mode = { "n", "v" } },
  },
}
