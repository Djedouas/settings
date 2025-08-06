local function get_venv()
  local venv = os.getenv("VIRTUAL_ENV")
  if venv ~= nil and string.find(venv, "/") then
    local orig_venv = venv
    for w in orig_venv:gmatch("([^/]+)") do
      venv = w
    end
    venv = string.format("(%s)", venv)
  else
    venv = "NO VENV"
  end
  return venv
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    sections = {
      lualine_y = { { get_venv, cond = function() return vim.bo.filetype == "python" end } },
    },
    extensions = { "nvim-tree", "symbols-outline" },
  },
}
