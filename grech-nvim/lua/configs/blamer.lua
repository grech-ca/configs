local M = {}

local g = vim.g

function M.config()
  g.blamer_enabled = 1
  g.blamer_delay = 300
  g.blamer_show_in_visual_modes = 1
  g.blamer_show_in_insert_modes = 0
end

return M

