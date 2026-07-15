local function get_venv()
  local venv = vim.env.VIRTUAL_ENV
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

local function qgis_version() return "QGIS " .. vim.env.MY_QGIS_VERSION end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    sections = {
      lualine_y = {
        { get_venv, cond = function() return vim.bo.filetype == "python" end },
        { qgis_version, cond = function() return vim.env.MY_QGIS_VERSION ~= nil end },
      },
    },
    extensions = { "nvim-tree", "symbols-outline" },
  },
}
