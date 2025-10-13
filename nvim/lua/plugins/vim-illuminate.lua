return {
  "RRethy/vim-illuminate",
  event = "BufEnter",
  config = function()
    require("illuminate").configure({
      delay = 1000,
      min_count_to_highlight = 2,
      filetypes_denylist = {
        "NvimTree",
      },
    })
  end,
}
